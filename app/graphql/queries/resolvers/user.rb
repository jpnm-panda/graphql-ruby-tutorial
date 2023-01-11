module Queries
  module Resolvers
    class User < GraphQL::Schema::Resolver
      type Types::UserType, null: false
      description "特定のUserの取得"

      argument :id, String, required: true, description: "Userのid"

      def resolve(params)
        # ::Userとしているのは、Queries::Resolvers::Userとして呼ばれるのを防ぐ為
        ::User.find(params[:id])
      end
    end
  end
end
