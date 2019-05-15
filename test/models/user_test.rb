require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be not valid because is empty" do
    u = User.new
    assert_not u.valid?
  end

  test "login should have at least 4 character" do
    u = User.new(login: 'bar', password: 'bbb', name: 'Foo')
    assert_not u.valid?
  end

  test "login should be unique" do
    u = User.new(login: 'barfoo', password: 'bbb', name: 'Foo')
    dup_u = u.dup
    u.save
    assert_not dup_u.valid?
  end
  
end
