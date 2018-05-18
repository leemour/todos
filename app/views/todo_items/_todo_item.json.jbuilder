json.extract! todo_item, :id, :todo_id, :text, :due_at, :priority, :created_at, :updated_at
json.url todo_item_url(todo_item, format: :json)
