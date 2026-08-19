require "test_helper"

class GuestbookTest < ActionDispatch::IntegrationTest
  test "root shows the guestbook with messages newest first" do
    get root_path
    assert_response :success
    assert_select "h1", "The guestbook"
    # Devon's entry is newer, so it must appear above Mira's.
    assert_match(/Devon.*Mira/m, response.body)
  end

  test "visitor can post a message without an account" do
    assert_difference("GuestbookMessage.count", 1) do
      post guestbook_messages_path,
        params: { guestbook_message: { name: "Ada", body: "Hello wall" } }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_match(/Hello wall/, response.body)
    assert_match(/Ada/, response.body)
  end

  test "a nameless post is credited to Anonymous" do
    post guestbook_messages_path,
      params: { guestbook_message: { body: "Just passing through" } }
    follow_redirect!
    assert_match(/Just passing through/, response.body)
    assert_match(/Anonymous/, response.body)
  end

  test "a blank body is rejected and the form re-renders" do
    assert_no_difference("GuestbookMessage.count") do
      post guestbook_messages_path,
        params: { guestbook_message: { name: "Ada", body: "   " } }
    end
    assert_response :unprocessable_entity
    assert_match(/can't be blank/, response.body)
  end
end
