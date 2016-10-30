class Calculator < MailForm::Base
  zip_regex_pl = %r{\d{2}-\d{3}}

  attribute :brand,                           :validate => true
  attribute :model,                           :validate => true
  attribute :capacity,                        :validate => true
  attribute :year,                            :validate => true
  attribute :registered_zipcode,              :validate => true, :format => { :with => zip_regex_pl }
  attribute :owner_birth,                     :validate => true
  attribute :driving_licence_issue_date,      :validate => true
  attribute :previous_insurance_company,      :validate => true
  attribute :last_policy_discount,            :validate => true
  attribute :last_year_damage_amount,         :validate => true
  attribute :contact_name,                    :validate => true
  attribute :email,                           :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone_number

  def headers
    {
      :subject => "Obliczenie OC",
      :to => "paula.grzesiak@gmail.com",
      :from => %("#{contact_name}" <#{email}>)
    }
  end

  def self.format_date(hash, field)
    Time.zone.local(*(1..3).map { |i| hash["#{field}(#{i}i)"] }).strftime("%d-%m-%Y")
  end
end