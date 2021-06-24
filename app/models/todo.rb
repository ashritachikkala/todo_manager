class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Today"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Later"
    puts due_later.map { |todo| todo.to_displayable_string }
  end

  def self.add_task(todo)
    Todo.create!(todo_text: todo[:todo_text], due_date: Date.today + todo[:due_in_days], completed: false)
  end

  def self.mark_as_complete(todo_id)
    to_mark = Todo.find(todo_id)
    to_mark.completed = true
    to_mark.save
    to_mark
  end
end
