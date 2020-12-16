require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should validate_length_of(:position).is_at_least(1).is_at_most(2) }
end
