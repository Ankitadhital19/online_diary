module Types
  module Users
    class UserInputType < BaseInputObject
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :dob, GraphQL::Types::ISO8601Date, required: true
      argument :location, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
    end
  end
end
