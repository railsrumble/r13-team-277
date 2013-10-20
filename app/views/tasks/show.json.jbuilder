json.extract! @task, :description, :task_type, :priority, :time, :created_at, :updated_at
json.category @task.category.name
