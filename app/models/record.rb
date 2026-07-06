class Record < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :watched_on, presence: true
end
