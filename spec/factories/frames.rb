FactoryBot.define do
  factory :frame do
    game
    frame_no { 1 }
    is_completed { false }

    trait :completed do
      is_completed { true }
    end
  end
end