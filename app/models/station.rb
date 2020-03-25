class Station < ApplicationRecord
    validates :line, presence: false
    validates :station, presence: false
    validates :minutes, presence: false

    belongs_to :property
end
