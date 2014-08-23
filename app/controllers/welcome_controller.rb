class WelcomeController < ApplicationController

  # skip_before_action :authenticate_user!
  def index
    @group = Group.find(current_user.group_id)
    @admin = User.find(@group.user_id)
  end
end
