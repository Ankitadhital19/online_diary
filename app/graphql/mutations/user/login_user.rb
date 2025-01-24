module Mutations
  module User
    class LoginUser < BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :message, String, null: true
      field :user, Types::UserType, null: false
      field :errors, [ String ], null: false

      def resolve(email:, password:)
        user = ::User.find_by(email: email)

        if user&.authenticate(password)
          # Return success message along with user data
          {
            message: "User has successfully logged in",
            user: user,
            errors: []
          }
        else
          # Return error message if authentication fails
          {
            message: nil,
            user: nil,
            errors: [ "Invalid email or password" ]
          }
        end
      end
    end
  end
end
