class Price < ApplicationRecord
  validates :duration, :unitary_price, :aditional_price, presence: true
end
