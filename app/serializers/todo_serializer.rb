class TodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  belongs_to :user
  has_many :todo_items
end
