require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "sign up saves the submitted nickname" do
    previous_user = ENV["BASIC_AUTH_USER"]
    previous_password = ENV["BASIC_AUTH_PASSWORD"]
    ENV["BASIC_AUTH_USER"] = "test-user"
    ENV["BASIC_AUTH_PASSWORD"] = "test-password"

    post user_registration_path,
         params: {
           user: {
             nickname: "ねむり",
             email: "signup@example.com",
             password: "password123",
             password_confirmation: "password123"
           }
         },
         headers: {
           "Authorization" => ActionController::HttpAuthentication::Basic.encode_credentials("test-user", "test-password")
         }

    assert User.exists?(email: "signup@example.com", nickname: "ねむり")
  ensure
    ENV["BASIC_AUTH_USER"] = previous_user
    ENV["BASIC_AUTH_PASSWORD"] = previous_password
  end
end