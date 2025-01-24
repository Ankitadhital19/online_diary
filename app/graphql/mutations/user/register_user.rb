module Mutations
  module User
    class RegisterUser < BaseMutation
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :dob, GraphQL::Types::ISO8601Date, required: true
      argument :location, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      field :user, Types::UserType, null: true
      field :errors, [ String ], null: false

      def resolve(first_name:, last_name:, dob:, location:, email:, password:, password_confirmation:)
        user = User.new(
          first_name: first_name,
          last_name: last_name,
          dob: dob,
          location: location,
          email: email,
          password: password,
          password_confirmation: password_confirmation
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
