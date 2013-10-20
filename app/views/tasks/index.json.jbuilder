json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :task_type, :priority, :time, :completed
  json.url task_url(task, format: :json)
end
