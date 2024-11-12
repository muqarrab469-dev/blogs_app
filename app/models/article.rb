class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true, length: { minimum: 3, maximum: 100 }
end
