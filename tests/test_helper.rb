$LOAD_PATH.unshift(File.join(File.expand_path(__dir__), '..', 'lib'))
require "minitest/autorun"
require 'jektify.rb'

class JektifyTest < Minitest::Test
    def test_that_it_has_a_version_number
        refute_nil ::Jektify::VERSION
    end
    def test_gem_path
        refute_nil ::Jektify::ENGINE.gem_path
    end
    def test_assets_path
        refute_nil ::Jektify::ENGINE.assets_path
    end
    def test_stylesheets_sass_path
        refute_nil ::Jektify::ENGINE.stylesheets_sass_path
    end      
end
