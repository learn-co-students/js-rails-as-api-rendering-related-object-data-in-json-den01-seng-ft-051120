class Bird < ApplicationRecord
    has_many :sightings
    has_many :locattions, through: :sightings
end