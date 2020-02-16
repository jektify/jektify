$LOAD_PATH.unshift(File.join(File.expand_path(__dir__), '..', 'lib'))
require "minitest/autorun"
require 'jektify.rb'

class JektifyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jektify::VERSION
    puts ::Jektify::VERSION
  end

#   def test_it_does_something_useful
#     assert false
#   end
end
