class UserTest < ActiveSupport::TestCase
  test "should be valid" do
    user = User.new(email: "unique_email@example.com", password: "password123")
    assert user.valid?, "User should be valid. Errors: #{user.errors.full_messages.to_sentence}"
  end

  test "should create a new user" do
    assert_difference('User.count') do
      user = User.create(email: "new_user@example.com", password: "password456")
      assert user.valid?, "User should be valid. Errors: #{user.errors.full_messages.to_sentence}"
    end
  end

  test "should not create a user with existing email" do
    existing_user = User.create(email: "existing_user@example.com", password: "password789")
    
    assert_no_difference('User.count') do
      user = User.create(email: "existing_user@example.com", password: "password101")
      assert_not user.valid?, "User should not be valid. Email is already taken."
    end
  end
end
