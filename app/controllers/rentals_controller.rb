class RentalsController < ApplicationController

  def new
    @rental = Rental.new
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])
    @tool = Tool.find(params[:tool_id])
  end

  def create

    # @rental = Rental.create({
    #   user_id: params[:user_id],
    #   tool_id: params[:tool_id],
    #   start_date: params[:start_date]
    #   })
    # if @rental.save
    #   UserMailer.rental_request_email(@rental,current_user).deliver
    #   flash[:notice] = 'Rental was successfully requested.'


    @tool = Tool.find params[:tool_id]
    @rental = Rental.create rental_params
    @rental.tool_id = @tool.id
    @rental.user_id = current_user.id
    if @rental.save == true
      UserMailer.rental_request_email(@rental,current_user).deliver
      flash[:notice] = 'Rental request was successfully sent.'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :tool_id, :start_date, :end_date)
  end

end
