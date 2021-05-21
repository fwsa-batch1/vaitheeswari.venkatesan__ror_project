class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  # To show all the todos
  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  # To create a new Todo
  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    response_text = "New todo is created with id #{new_todo.id}"
    render plain: response_text
  end

  # To change the completed status of a user
  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save
    render plain: "Updated Todo  #{todo.id} with completed status : #{todo.completed}"
  end

  # To show a particular todo using id
  def show
    id = params[:id]
    render plain: Todo.find(id).to_pleasant_string
  end
end
