class Product < ApplicationRecord
  searchkick language: 'french'
  validates :name, presence: true, length: { minimum: 5 }

  has_many :information

  RECENT_NUMBER = 10

  def self.recent(number = RECENT_NUMBER)
    order(:updated_at).limit(number)
  end

  def name_and_class
    "#{name} (#{model_name.human})"
  end
end
