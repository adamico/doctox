# This model will be abstracted to DomainModel
# depending on use case this could be either Mono or Polymorphic
# e.g. for DocTox the DomainModel is a substance/product/drug

class Product < ApplicationRecord
  # tagging contexts will be dynamically defined during runtime choosing them
  # from a custom list saved in the site settings
  # e.g. for DocTox we have synonyms, symptoms, exposition contexts
  acts_as_taggable

  scope :search_import, -> { includes(:tags) }

  searchkick language: 'french'
  validates :name, presence: true, length: { minimum: 5 }

  has_many :information

  RECENT_NUMBER = 10

  def self.recent(number = RECENT_NUMBER)
    order(:updated_at).limit(number)
  end

  def search_data
    { name_tagged: "#{name} #{tags.map(&:name).join(' ')}" }
  end
end
