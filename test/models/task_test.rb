require_relative "../test_helper.rb"

class TaskTest < Minitest::Test

	def test_attributes_get_assigned_correctly
		data = {"id"=>1, "title"=>"stuff", "description"=>"things"}
		task = Task.new(data)
		assert_equal 1, task.id
		assert_equal "stuff", task.title
		assert_equal "things", task.description
	end

end