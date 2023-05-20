class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @user_rentals = Rental.where(user_id: current_user.id)
#     @user_historical_rentals = current_user.rentals.where("end_date < ?", Date.today)
    @user_historical_rentals = Rental.where(user_id: current_user.id)
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
    @watch = Watch.find(params[:watch_id])

  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    @watch = Watch.find(params[:watch_id])
    # link the current user as the booking user in rentals
    @rental.user = current_user
    # link the selected watch as the booked watch in rentals
    @rental.watch = @watch
    if @rental.save
      redirect_to user_rentals_path(current_user), notice: 'Rental was successfully created.'
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
    redirect_to user_rentals_path(current_user), notice: 'Rental was successfully cancelled.'
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:start_date, :end_date, :user_id, :watch_id, :watch_owner_id)
    end
end
