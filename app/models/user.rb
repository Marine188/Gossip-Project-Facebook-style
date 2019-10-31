class User < ApplicationRecord
  # N - 1 association with cities table
  belongs_to :city

  # 1 - N association with gossips table
  has_many :gossips
end
