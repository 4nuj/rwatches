require 'rmagick'

class WatchesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if current_user.nil?
      @watches = Watch.all
    else
      @watches = Watch.where.not(user_id: current_user.id)
    end
    if params[:query].present?
      sql_subquery = "brand ILIKE :query OR model ILIKE :query"
      @watches = @watches.where(sql_subquery, query: "%#{params[:query]}%")
    end

    case params[:sort_by]
    when "price_asc"
      @watches = @watches.order(price: :asc)
    when "price_desc"
      @watches = @watches.order(price: :desc)
    when "reviews_desc"
      @watches = @watches.order(reviews: :desc)
    when "reviews_asc"
      @watches = @watches.order(reviews: :asc)
    end

    @markers = @watches.geocoded.map do |watch|
      {
        lat: watch.latitude,
        lng: watch.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {watch: watch}),
        marker_html: render_to_string(partial: "marker", locals: {watch: watch})
      }
    end
  end


  def my_watches
    @watches = current_user.watches
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = current_user.watches.build
    @watches = Watch.where(user: current_user)
  end

  def create
    @watch = current_user.watches.build(watch_params)
    if @watch.save
     # redirect_to @watch. original content , replacing with my watches
     redirect_to my_watches_path, notice: 'Watch created successfully!'
    else
      render 'new'
    end
  end

  def edit
    @watch = current_user.watches.find(params[:id])
  end

  def update
    @watch = current_user.watches.find(params[:id])
    if @watch.update(watch_params)
      redirect_to my_watches_path
    else
      render 'edit'
    end
  end

  def destroy
    @watch = current_user.watches.find(params[:id])
    @watch.destroy
    redirect_to my_watches_path
  end

  private

  def watch_params
    params.require(:watch).permit(:brand, :model, :description, :price, :address, :image)
  end
end
