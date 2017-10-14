class Message < ApplicationRecord
  validates :content, presence: true
  validates :account, presence: true
  belongs_to :account
end
