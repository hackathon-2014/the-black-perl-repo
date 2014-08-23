class WelcomeController < ApplicationController

  # skip_before_action :authenticate_user!
  def index
    @group = Group.find(current_user.group_id)
    @admin = User.find(@group.user_id)
    @members = User.where(group_id: @group.id)
  end
end

