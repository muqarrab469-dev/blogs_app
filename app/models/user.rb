class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 10 }
  validates :password, presence: true, length: { minimum: 1, maximum: 15 }

  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, multiline: true }
  has_secure_password
end
