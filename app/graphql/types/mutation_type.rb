# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::User::RegisterUser
    field :login_user, mutation: Mutations::User::LoginUser
  end
end
