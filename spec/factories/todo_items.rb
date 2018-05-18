FactoryBot.define do
  factory :todo_item do
    todo nil
    text "MyText"
    due_at "2018-05-18 13:30:49"
    priority 1
  end
end
