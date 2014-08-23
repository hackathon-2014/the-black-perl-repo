class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_email(email)
    @user = current_user
    @group = Group.find(user_id: @user.id)
    @url  = 'http://localhost:3000/groups/' + @group.id
    mail(to: email, subject: 'Come join my tool group!')
  end
end
