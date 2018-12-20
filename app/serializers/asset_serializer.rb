class AssetSerializer < ActiveModel::Serializer
  attributes :ticker, :name, :price, :quantity
end
