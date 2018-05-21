class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.references :todo, foreign_key: true
      t.text :text
      t.datetime :due_at
      t.integer :priority
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :todo_items, :text
    add_index :todo_items, :due_at
    add_index :todo_items, :priority
    add_index :todo_items, :status
  end
end
