class UserMailer < ActionMailer::Base
  default :from => "ranjit@gmail.com"

  def contact_confirmation(contact)
    @contact = contact
    mail(:to => "fpalmas@yahoo.com", :subject => "ContactUs", :from => contact.email )
  end
end
