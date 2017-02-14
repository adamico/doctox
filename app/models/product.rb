class Product < ApplicationRecord
  acts_as_taggable
  scope :search_import, -> { includes(:tags) }

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

  def search_data
    { name_tagged: "#{name} #{tags.map(&:name).join(' ')}" }
  end
end
