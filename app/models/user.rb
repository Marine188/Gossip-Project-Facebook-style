class User < ApplicationRecord
    has_secure_password # la gem bcrypt est fonctionnel

  # N - 1 association with cities table
  belongs_to :city

  # 1 - N association with gossips table
  has_many :gossips

  validates :email, #on valide l'email, format, presence
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Mauvais format" }

  validates :password, # on valide le mdp, presence et longeur compris entre 6 et 20
    presence: true,
    length: { in: 6..20 }

end
