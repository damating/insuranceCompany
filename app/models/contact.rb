class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject
  attribute :message

  def headers
    {
      :subject => "#{subject}",
      :to => "paula.grzesiak@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end