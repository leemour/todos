require 'rails_helper'

RSpec.describe "todo_items/edit", type: :view do
  before(:each) do
    @todo_item = assign(:todo_item, TodoItem.create!(
      :todo => nil,
      :text => "MyText",
      :priority => 1
    ))
  end

  it "renders the edit todo_item form" do
    render

    assert_select "form[action=?][method=?]", todo_item_path(@todo_item), "post" do

      assert_select "input[name=?]", "todo_item[todo_id]"

      assert_select "textarea[name=?]", "todo_item[text]"

      assert_select "input[name=?]", "todo_item[priority]"
    end
  end
end
