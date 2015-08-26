require_relative "../test_helper.rb"

class TaskManagerTest < Minitest::Test

	def test_it_creates_a_task 
			data = {:id=>1, :title=>"stuff", :description=>"things"}
			TaskManager.create(data)
			task = TaskManager.find(1)
			assert_equal Task, task.class
			assert_equal "stuff", task.title
			assert_equal 1, task.id
	end

	def test_all_method
		data1 = {:id=>1, :title=>"stuff", :description=>"things"}
		data2 = {:id=>2, :title=>"moar stuff", :description=>"moar things"}
		TaskManager.create(data1)
		TaskManager.create(data2)
		tasks = TaskManager.all
		assert_equal 2, tasks.count
		assert_equal 2, tasks.last.id
		assert_equal "moar stuff", tasks.last.title
		assert_equal "things", tasks.first.description
	end

	def test_update_method
		data = {:id=>1, :title=>"stuff", :description=>"things"}
		new_task = {:id=>1, :title=>"diff", :description=>"junk"}
		TaskManager.create(data)
		TaskManager.update(1, new_task)
		task = TaskManager.find(1)
		assert_equal "diff", task.title
		assert_equal "junk", task.description
	end

	def test_delete_method
		data1 = {:id=>1, :title=>"stuff", :description=>"things"}
		data2 = {:id=>2, :title=>"moar stuff", :description=>"moar things"}
		TaskManager.create(data1)
		TaskManager.create(data2)
		assert_equal 2, TaskManager.all.count
		TaskManager.delete(1)
		tasks = TaskManager.all
		assert_equal 1, tasks.count
		assert_equal 2, tasks.last.id
		assert_equal 2, tasks.first.id
		assert_equal "moar stuff", tasks.first.title
	end

end