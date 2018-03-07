class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class=Authentication
  end
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  has_many :sent_messages, class_name:'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :recieved_messages, class_name:'Message', foreign_key: 'reciever_id', dependent: :destroy
  has_many :comments

  ValidEmailRegEx= /\A[\w+\d\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save {email.downcase!}
  validates :username, {presence: true, length: {maximum: 50}}
  validates :email, {presence: true, length:{maximum: 255},
                     format: {with: ValidEmailRegEx},
                     uniqueness:{case_sensitive: false}
                     }
  validates_confirmation_of :password
  validates :password, {presence: true, length: {minimum:6}, allow_nil: true}

  def all_messages
    Message.where("sender_id=? OR reciever_id=?",id,id)
  end
end
