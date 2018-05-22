class TodoItemsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  def index
    @todo_items = TodoItem.where(todo_id: params[:todo_id]).
      from_due_at(params[:from]).
      to_due_at(params[:to]).
      by_priority(params[:priority])
      
    respond_to do |format|
      format.html { }
      format.js   { render layout: false }
    end
  end

  def show
  end

  def new
    @todo_item = TodoItem.new
  end

  def edit
  end

  def create
    @todo_item = TodoItem.new(todo_item_create_params)
    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_path(@todo_item.todo_id), notice: 'Todo item was successfully created.' }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_update_params)
        format.html { redirect_to todo_path(@todo_item.todo_id), notice: 'Todo item was successfully updated.' }
        format.js   { render :update, layout: false, status: :ok }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: 'Todo item was successfully destroyed.' }
      format.js   { render :destroy, layout: false }
      format.json { head :no_content }
    end
  end

  def complete
    @todo_item = TodoItem.find(params[:todo_item_id])
    @todo_item.update(status: params[:status])
    respond_to do |format|
      format.js   { render :complete, layout: false }
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
