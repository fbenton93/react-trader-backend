class Asset < ApplicationRecord
  validates :ticker, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
end
