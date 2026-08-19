require "test_helper"

class GuestbookMessageTest < ActiveSupport::TestCase
  test "author falls back to Anonymous when no name is given" do
    assert_equal "Anonymous", GuestbookMessage.new(body: "hi").author
    assert_equal "Mira", GuestbookMessage.new(name: "Mira", body: "hi").author
  end

  test "requires a non-blank body" do
    message = GuestbookMessage.new(name: "Mira", body: "   ")
    assert_not message.valid?
    assert_includes message.errors[:body], "can't be blank"
  end

  test "caps body and name length" do
    message = GuestbookMessage.new(name: "x" * 81, body: "y" * 501)
    assert_not message.valid?
    assert_includes message.errors[:name], "is too long (maximum is 80 characters)"
    assert_includes message.errors[:body], "is too long (maximum is 500 characters)"
  end

  test "strips surrounding whitespace on save" do
    message = GuestbookMessage.create!(name: "  Ada  ", body: "  Hello wall  ")
    assert_equal "Ada", message.name
    assert_equal "Hello wall", message.body
  end

  test "newest_first orders by newest first" do
    assert_equal [guestbook_messages(:newer), guestbook_messages(:older)],
      GuestbookMessage.newest_first.to_a
  end
end
