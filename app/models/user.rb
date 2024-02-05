class User < ApplicationRecord
validates :name, presence: true, length: { minimum: 3, maximum: 50 }
validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { minimum: 5, maximum: 255 }

before_create :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end

end
