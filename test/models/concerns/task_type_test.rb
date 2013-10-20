require 'test_helper'
require 'task_type'
require 'pry'

class TaskTypeTest < ActiveSupport::TestCase
  test "find image" do
    task = Task.new
    image = task.find_image("do ml assignment")
    assert_equal "homework", image
  end
end
