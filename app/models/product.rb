class Product < ActiveRecord::Base
  validates :title, presence: true
  has_many :offers
  has_many :legitimate_offers, -> { where(legitimate: true) }, class_name: 'Offer'
end
