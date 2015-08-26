ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/emoji"
class Minitest::Test
	def teardown
		TaskManager.delete_all
	end
end