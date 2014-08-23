class UserMailer < ActionMailer::Base
  default from: "admin@t00lshed.com"

  def invite_emails(list, group)
    list.each do |recipient|
      @recipient = recipient
      @sender = User.find(group.user_id)
      @group = group
      # binding.pry
      mail(to: @recipient, subject: 'Come join my tool sharing group!')

    end
  end


  def rental_request_email(rental,requester)
    @sender = requester
    @recipient = User.find(rental.user_id)
    @group = Group.find(@sender.group_id)
    @tool = Tool.find(rental.tool_id)
    @url  = "http://t00lshed.herokuapp.com/group/" + @group.id.to_s + "users/" + @recipient.id.to_s + "/tools/" + @tool.id.to_s + "/rentals/" + rental.id.to_s
    mail(to: @recipient.email, subject: 'Rental Request from' + @sender.name)
  end
end
