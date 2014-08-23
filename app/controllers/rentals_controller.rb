class RentalsController < ApplicationController

  def new
    @rental = Rental.new

  end

  def create
    @rental = Rental.create rental_params
    if @rental.save
      UserMailer.rental_request_email(@rental).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:tool).permit(:user_id, :tool_id, :start_date, :end_date)
  end

end
