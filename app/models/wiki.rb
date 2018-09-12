class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user

  accepts_nested_attributes_for :collaborations, allow_destroy: true

  after_initialize do |wiki|
    if wiki.private.nil?
      wiki.private = false
    end
  end

end
