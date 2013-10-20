json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :weight, :task_type, :priority, :time, :completed
  json.url task_url(task, format: :json)
end
