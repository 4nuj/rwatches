class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.where(user: current_user)
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    raise
    if @rental.save
      redirect_to @rental, notice: 'Rental was successfully created.'
    else
      render :new
    end
  end

  def update
    if @rental.update(rental_params)
      redirect_to @rental, notice: 'Rental was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rental.destroy
    redirect_to rentals_url, notice: 'Rental was successfully destroyed.'
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:start_date, :end_date, :user_id, :watch_id, :watch_owner_id)
    end
end
