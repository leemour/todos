class Todo < ApplicationRecord
  belongs_to :user
  has_many :todo_items, -> { order('todo_items.created_at ASC') }

  validates :name, presence: true, 
    length: {minimum: 3, maximum: 100}
end
