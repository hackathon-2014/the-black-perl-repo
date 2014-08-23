class GroupsController < ApplicationController
  before_action(:find_group, only: [:show, :edit, :update, :destroy])

  def new
    @group = Group.new
  end

  def create
    @group = Group.new({name: params[:name]})
    @group.user_id = current_user.id #owner/admin
    if @group.save
      flash[:notice] = 'Group was successfully created.'
      redirect_to group_path(@group)
    else
      render :action => 'new'
    end

  end

  def edit

  end

  def update
    if @group.update_attributes({name: params[:name]})
      flash[:notice] = 'Group was successfully updated.'
      redirect_to :action => 'show', :id => @group
    else
      render :action => 'edit'
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = 'Group was successfully deleted.'
    redirect_to root_path
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end


end
