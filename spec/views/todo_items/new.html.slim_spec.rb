require 'rails_helper'

RSpec.describe "todo_items/new", type: :view do
  before(:each) do
    assign(:todo_item, TodoItem.new(
      :todo => nil,
      :text => "MyText",
      :priority => 1
    ))
  end

  it "renders new todo_item form" do
    render

    assert_select "form[action=?][method=?]", todo_items_path, "post" do

      assert_select "input[name=?]", "todo_item[todo_id]"

      assert_select "textarea[name=?]", "todo_item[text]"

      assert_select "input[name=?]", "todo_item[priority]"
    end
  end
end
