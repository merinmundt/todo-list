class Task < ApplicationRecord
  belongs_to :employee
  belongs_to :priority
  attribute :status, :boolean, default: false

end
