class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!


  # skip_before_action :authenticate_user!
  def index
    @group = Group.find(current_user.group_id)
    @admin = User.find(@group.user_id)
    @members = User.where(group_id: @group.id)
    @tools = Tool.all
    @members.each do |member|
      @tools.select do |tool|
        tool.user_id == member.id
      end
    end
  end

end

