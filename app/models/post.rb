class Post < ApplicationRecord
  belongs_to :user

  scope :by_date_created, -> { order('created_at desc') }
end
