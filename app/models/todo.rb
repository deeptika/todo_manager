#todo.rb

class Todo < ActiveRecord::Base
  belongs_to :user

  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  def due_today?
    due_date == Date.today
  end

  def to_pleasant_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today).order(:due_date)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date  > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end
