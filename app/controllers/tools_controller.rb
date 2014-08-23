class ToolsController < ApplicationController

  before_action :find_tool, only: [:show, :edit, :update, :destroy, :transition]
  before_action :find_user
  before_action :find_group, only: [:new, :create, :show]

  def index
    @tools = @group.users.tools.where params[:category_id]
  end

  def show

  end

  def new
    @tool = Tool.new
    @categories = Category.all
  end

  def create
    @tool = Tool.new({name: params[:name], category_id: params[:category]})
    @tool.user_id = current_user.id
    if @tool.save
      redirect_to root_path
    else
      render :new
    end
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
    @tool = Tool.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def tool_params
    params.require(:tool).permit(:name, :user_id, :image_url, :category_id, :checked_out?)
  end


end
