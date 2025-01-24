module Mutations
  module User
    class RegisterUser < BaseMutation
      argument :user_info, Types::Users::UserInputType, required: true

      field :user, Types::UserType, null: true
      field :errors, [ String ], null: false

      def resolve(user_info:)
        user = ::User.new(
          first_name: user_info[:first_name],
          last_name: user_info[:last_name],
          dob: user_info[:dob],
          location: user_info[:location],
          email: user_info[:email],
          password: user_info[:password],
          password_confirmation: user_info[:password_confirmation]
        )

        if user.save
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end
  end
end
