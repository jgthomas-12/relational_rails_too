class Area < ApplicationRecord

  has_many :climbs

  def self.sort_by_created_at
    order(created_at: :desc)
  end
end