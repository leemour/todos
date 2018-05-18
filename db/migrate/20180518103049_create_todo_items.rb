class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.references :todo, foreign_key: true
      t.text :text
      t.datetime :due_at
      t.integer :priority

      t.timestamps
    end
  end
end
