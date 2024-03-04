# Task List App
# class for the task list app

class Task
    attr_accessor :title, :description, :status
  
    # Constructor to initialize a task
    def initialize(title, description = "")
      @title = title
      @description = description
      @status = "incomplete"
    end
  
    # Method to mark a task as complete
    def mark_as_complete
      @status = "complete"
    end
  
    # to sting method to display the task
    def to_s
      "Task: #{@title} - Status: #{@status}"
    end
  end
  
  class TaskList
    def initialize
      @tasks = []
    end
  
    # Method to add tasks
    def add_task(title, description = "")
      task = Task.new(title, description)
      @tasks << task
    end
  
    # Method to add priority tasks
    def add_priority_task(title, description, priority)
      task = PriorityTask.new(title, description, priority)
      @tasks << task
    end
  
    # Method to remove tasks
    def remove_task(title)
      @tasks.delete_if { |task| task.title == title }
    end
  
    # Method to list all tasks
    def list_tasks
      puts "Tasks:"
      @tasks.each { |task| puts task }
      puts "\n"
    end
  
    # Method to find a task by its title
    def find_task(title)
      @tasks.find { |task| task.title == title }
    end
  
    # Method to find a priority task by its title
    def find_priority_task(title)
      @tasks.find { |task| task.is_a?(PriorityTask) && task.title == title }
    end
  
    # Method to mark a task as complete
    def mark_task_complete(title)
      task = @tasks.find { |task| task.title == title }
      task&.mark_as_complete if task
    end
  end
  
  # PriorityTask class inherits from Task class
  class PriorityTask < Task
    attr_accessor :priority
  
    # Constructor for PriorityTask class
    def initialize(title, description, priority)
      super(title, description)
      @priority = priority
    end
  
    # to string method to display the priority task
    def to_s
      "Priority Task: #{@title} - Status: #{@status} - Priority: #{@priority}"
    end
  end

  task_list = TaskList.new
  
  # Adding tasks to the task list
  task_list.add_task("Do homework")
  task_list.add_task("Go to the gym", "Cardio workout") 
  task_list.add_priority_task("Buy groceries", "Milk and eggs", "high")

  task_list.list_tasks
  
  task_list.mark_task_complete("Go to the gym")
  
  puts task_list.find_task("Do homework")
  
  puts task_list.find_priority_task("Buy groceries")
  