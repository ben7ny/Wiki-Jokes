class Wiki < ApplicationRecord
  belongs_to :user

    after_initialize do |wiki|
      if wiki.private.nil?
        wiki.private = false
      end
    end

end
