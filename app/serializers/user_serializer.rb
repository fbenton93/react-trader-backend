class UserSerializer < ActiveModel::Serializer
  attributes :email, :username, :balance, :active_assets
end

def active_assets
  object.active_assets
end
