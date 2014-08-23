class GroupsController < ApplicationController
  before_action(:find_group, only: [:show, :edit, :update, :destroy])

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'Group was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @recipe.update_attributes(group_params)
      flash[:notice] = 'Group was successfully updated.'
      redirect_to :action => 'show', :id => @group
    else
      render :action => 'edit'
    end
  end

  def destroy
    @group.destroy
    redirect_to :action => :index
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find(params[:id])
  end


end
