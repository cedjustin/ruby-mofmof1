class Property < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :address, presence: true
    validates :rent, presence: true, length: { minimum: 2 }
    validates :year, presence: true

    has_many:stations, dependent: :destroy
    accepts_nested_attributes_for :stations, allow_destroy: true
end
