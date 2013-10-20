json.extract! @task, :id, :description, :task_type, :priority, :time, :created_at, :updated_at, :completed
json.category @task.category_name
