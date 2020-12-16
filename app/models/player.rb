class Player < ApplicationRecord
  validates :position,
    length: { in: 1..2 }
end
