class User < ApplicationRecord
validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }
validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { minimum: 5, maximum: 255 }
validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, less_than: 100 }

before_create :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end

end
