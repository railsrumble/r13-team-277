json.array!(@tasks) do |task|
  json.extract! task, :description, :task_type, :priority, :time
  json.url task_url(task, format: :json)
end
