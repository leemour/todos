class TodoItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :todo, :due_at, :priority, :status
  belongs_to :todo
end
