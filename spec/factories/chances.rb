FactoryBot.define do
  factory :chance do
    frame
    chance_no { 1 }
    chance_score { 0 }
    is_completed { false }
  end
end