class ToolsController < ApplicationController

  before_action :find_tool, only: [:show, :edit, :update, :destroy, :transition] 

  def index
    @tools = @group.users.tools.where params[:category_id]
  end

  def show

  end

  def new

  end

  def create
    
  end

  def edit
    
  end

  def update
    if @tool.update_attributes tool_params
      redirect_to group_user_tool_path(@group, @user, @tool)
    else
      render :edit
    end
  end

  def destroy
    @tool.destroy
    redirect_to group_user_path(@group, @user)
  end

  private

  def find_tool
    @tool = Tool.find params[:id]
  end

  def find_user
    @user = User.find params[:id]
  end

  def find_group
    @group = Group.find params[:id]
  end

  def tool_params
    params.require(:tool).permit(:name, :user_id, :image_url, :category_id, :checked_out?)
  end


end
