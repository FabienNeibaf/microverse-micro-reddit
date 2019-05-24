require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @u1 = User.new name: "Foo Bar", email: 'foobar@example.com', password: 'foo_bar'
    @p1 = Post.new title: 'Learning Ruby on Rails', body: "It's a piece of cake!"
  end

  test "content should be present" do
    @p1.user = @u1

    c = Comment.new
    c.user = @u1
    c.post = @p1

    assert_not c.valid?
  end

  test "content should have a length of at least 10" do
    @p1.user = @u1

    c = Comment.new content: "a" * 9
    c.user = @u1
    c.post = @p1

    assert_not c.valid?
  end

  test "content with a length of at least 10 is valid" do
    @p1.user = @u1

    c = Comment.new content: "a" * 10
    c.user = @u1
    c.post = @p1

    assert c.valid?
  end

  test "empty ref to post should not be valid" do
    c = Comment.new content: "Great link !"
    c.user = @u1

    assert_not c.valid?
  end

  test "empty ref to user should not be valid" do
    c = Comment.new content: "Great link !"
    c.post = @p1

    assert_not c.valid?
  end

  test "should not save a comment without valid post" do

    c = Comment.new content: "Great link !"
    c.post = @p1 # Post don't have a user
    c.user = @u1

    assert_not c.valid? # false #, "Should not save post without valid post"
  end

  test "should not save a comment without valid user" do
    @p1.user = @u1
    u2 = User.new name: 'Fuzz Buzz', email: 'fuzz@example,com', password: 'buzzff'

    c = Comment.new content: "Great Artilce!"
    c.post = @p1
    c.user = u2  # User not valid because of invalid email

    assert_not c.valid?
  end
end
