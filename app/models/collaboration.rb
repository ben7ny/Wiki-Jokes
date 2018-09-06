class Collaboration < ApplicationRecord
  belongs_to :wiki
  belongs_to :user
end
