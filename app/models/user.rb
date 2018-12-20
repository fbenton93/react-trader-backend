class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }

  has_many :assets, dependent: :destroy

  def active_assets
    self.assets.select do |asset|
      asset.open
    end
  end


end
