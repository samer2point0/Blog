class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :reciever, class_name: 'User'
  validates :sender, presence: true
  validates :reciever, presence:true
  validates :body, length: {minimum: 10}
  default_scope -> {order(created_at: :desc)}
end
