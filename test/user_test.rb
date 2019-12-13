require 'test/unit'
require_relative '../src/user'

class UserTest < Test::Unit::TestCase
  def test_name
    name = 'Arseniy'
    user = User.new(name)
    assert_equal name, user.name
  end
end
