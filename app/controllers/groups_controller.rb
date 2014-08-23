class GroupsController < ApplicationController
  before_action(:find_group, only: [:show, :edit, :update, :destroy])

  def new
    @group = Group.new
  end

  def create
    @group = Group.new({name: params[:name]})
    @invites = params[:invites].split(",")
    @group.user_id = current_user.id #owner/admin
    current_user.group_id = @group.id
    if @group.save
      current_user.update_attributes({group_id: @group.id})
      flash[:notice] = 'Group was successfully created.'

      redirect_to root_path

      UserMailer.invite_emails(@invites, @group).deliver

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
