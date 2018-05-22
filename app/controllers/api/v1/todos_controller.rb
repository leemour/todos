class API::V1::TodosController < API::V1::BaseController  
  before_action :set_todo, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @todos = Todo.includes(:todo_items)
    render json: TodoSerializer.new(@todos)
  end

  def show
    render json: TodoSerializer.new(@todo, include: [:todo_items])
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    if @todo.save
      render json: TodoSerializer.new(@todo), status: :created
    else
      api_error(status: :unprocessable_entity, errors: @todo.errors)
    end
  end

  def update
    if @todo.update(todo_params)
      head :ok
    else
      api_error(status: :unprocessable_entity, errors: @todo.errors)
    end
  end

  def destroy
    if @todo.destroy
      head :no_content
    else
      api_error(status: :unprocessable_entity, errors: @todo.errors)
    end
  end

  private
  
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :user_id)
  end
end
