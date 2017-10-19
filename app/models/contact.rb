class Contact < ApplicationRecord
  belongs_to :company
  validates :full_name, :position, :email, presence: true
end
