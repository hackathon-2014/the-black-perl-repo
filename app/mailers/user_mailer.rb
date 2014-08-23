class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_emails(list, group)
    list.each do |recipient|
      @recipient = recipient
      @sender = User.find(group.user_id)
      @group = group
      # binding.pry
      mail(to: @recipient, subject: 'Come join my tool sharing group!')

    end
  end


  def rental_request_email(rental)
    @sender = current_user
    @recipient = User.find(tool.user_id)
    @group = Group.find(current_user.group_id)
    @tool = Tool.find(rental.tool_id)
    @url  = "http://localhost:3000/rentals/" + rental.id
    mail(to: @recipient.email, from: @sender.email, subject: 'Rental Request from' + @sender.name)
  end
end
