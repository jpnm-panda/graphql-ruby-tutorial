module Mutations
  class AddUser < BaseMutation
    field :user, Types::UserType, null: false

    argument :name, String, required: true
    argument :age, Integer, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    def resolve(params)
      user = User.create(name: params[:name], age: params[:age])
      {
        "user": user
      }
    end
  end
end
