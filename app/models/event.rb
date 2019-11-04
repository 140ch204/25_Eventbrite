class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user
  

  validates :start_date, 
    presence: {message: "Merci de saisir une date !"} #,
    #if is_in_the_futur?
    #il est impossible de créer ou modifier un événement dans le passé.
  validates :duration, 
    presence: {message: "Merci de saisir une durée !"}#,
    #numericality: { only_integer: true }
    #le nombre de minutes doit être un multiple de 5, et est strictement positif
  validates :title, 
    presence: {message: "Merci de saisir un titre !"},
    length: {minimum: 5, maximum: 140, message: "Le titre doit être entre 5 et 140 caractères"}
  validates :description, 
    presence: {message: "Merci de saisir un contenu !"},
    length: {minimum: 20, maximum: 1000, message: "La description doit être entre 20 et 1000 caractères"}
  validates :price,
    presence: {message: "Merci de saisir un prix !"},
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
   # cet integer doit être compris entre 1 et 1000
  validates :location, 
    presence: {message: "Merci de saisir une ville !"}
end
