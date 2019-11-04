class Event < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user
  

  validate :divisible_by_five, :is_in_future?

  validates :start_date, 
    presence: {message: "Merci de saisir une date !"} #,
    #if is_in_the_futur?
    #il est impossible de créer ou modifier un événement dans le passé.
  validates :duration, 
    presence: {message: "Merci de saisir une durée !"}
  validates :title, 
    presence: {message: "Merci de saisir un titre !"},
    length: {minimum: 5, maximum: 140, message: "Le titre doit être entre 5 et 140 caractères"}
  validates :description, 
    presence: {message: "Merci de saisir un contenu !"},
    length: {minimum: 20, maximum: 1000, message: "La description doit être entre 20 et 1000 caractères"}
  validates :price,
    presence: {message: "Merci de saisir un prix !"},
    numericality: { in: 1..1000 }
  validates :location, 
    presence: {message: "Merci de saisir une ville !"}


  def divisible_by_five
    if (self.duration % 5) != 0
      self.errors[:base] << "La durée doit être un multiple de 5"
    end
  end

  def is_in_future?
    self.start_date  >=  Date.today
  end

  end


