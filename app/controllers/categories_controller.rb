class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @group = Group.find(current_user.group_id)
    @members = User.where(group_id: @group.id)
    @tools = []
    @members.each do |member|
      Tool.all.each do |tool|
        if tool.user_id == member.id && tool.category_id == @category.id
          @tools.push(tool)
        end
      end
    end
  end
end
