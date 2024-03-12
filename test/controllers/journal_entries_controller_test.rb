require "test_helper"

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get journal_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get journal_entries_create_url
    assert_response :success
  end

  test "should get show" do
    get journal_entries_show_url
    assert_response :success
  end
end
