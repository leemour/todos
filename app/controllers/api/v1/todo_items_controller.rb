class API::V1::TodoItemsController < API::V1::BaseController  
  before_action :set_todo_item, only: [:show, :update, :destroy, :complete]

  respond_to :json

  def index
    @todo_items = TodoItem.includes(:todo)
    render json: TodoItemSerializer.new(@todo_items, include: [:todo])
  end

  def show
    render json: TodoItemSerializer.new(@todo_item, include: [:todo])
  end

  def create
    @todo_item = TodoItem.new(todo_item_create_params)

    if @todo_item.save
      render json: TodoItemSerializer.new(@todo_item), status: :created
    else
      api_error(status: :unprocessable_entity, errors: @todo_item.errors)
    end
  end

  def update
    if @todo_item.update(todo_item_create_params)
      head :ok
    else
      api_error(status: :unprocessable_entity, errors: @todo_item.errors)
    end
  end

  def destroy
    if @todo_item.destroy
      head :no_content
    else
      api_error(status: :unprocessable_entity, errors: @todo_item.errors)
    end
  end

  def complete
    if @todo_item.update(status: params[:status])
      head :ok
    else
      api_error(status: :unprocessable_entity, errors: @todo_item.errors)
    end
  end

  private
  
  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def todo_item_create_params
    params.require(:todo_item).permit(
      :todo_id, 
      :text, 
      :due_at, 
      :priority
    )
  end

  def todo_item_update_params
    params.require(:todo_item).permit(
      :text, 
      :due_at, 
      :priority, 
      :status
    )
  end
end
