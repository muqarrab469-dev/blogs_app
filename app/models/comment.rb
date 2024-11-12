class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  validates :commenter, :body, presence: true, length: { minimum: 1, maximum: 50 }
end
