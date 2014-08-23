class WelcomeController < ApplicationController

  # skip_before_action :authenticate_user!


  # skip_before_action :authenticate_user!
  def index
    @group = Group.find(current_user.group_id)
    @admin = User.find(@group.user_id)
    @members = User.where(group_id: @group.id)
    @tools = []
    # only tools that belong to members are included
    @members.each do |member|
      Tool.all.each do |tool|
        if tool.user_id == member.id
          @tools.push(tool)
        end
      end
    end
    # narrowing down categories to group's totals and only listed once
    @categories = []
    @tools.each do |tool|
      category = Category.find(tool.category_id)
      @categories.push(category) unless @categories.include?(category)
    end
  end

end
