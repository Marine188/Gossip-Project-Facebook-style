class Gossip < ApplicationRecord
  # N - 1 association with users table
  belongs_to :user

  # must have a 3 to 14 characters length
  validates :title, 
  presence: true, 
  length: { in: 3..14, message: 'must be between 3 and 14 characters long' }

  # must have a non empty (min 30 char) content
  validates :content,
  presence: true,
  length: { minimum: 30, message: 'must be at least 30 characters long' }
end
