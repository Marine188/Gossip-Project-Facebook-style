class Gossip < ApplicationRecord
  # N - 1 association with users table
  belongs_to :user


  validates :title, # valide la présence obligatoire d'un titre compris entre 3 et 14 caractères
  presence: true,
  length: { in: 3..14, message: 'Le titre doit être compris entre 3 and 14 caractères' }


  validates :content, # valide la présence du contenur avec un minimum de 30 caractères
  presence: true,
  length: { minimum: 30, message: 'Le contenu doit avoir plus de 30 caractères' }
end
