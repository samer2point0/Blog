class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class=Authentication
  end
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  ValidEmailRegEx= /\A[\w+\d\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save {email.downcase!}
  validates :username, {presence: true, length: {maximum: 50}}
  validates :email, {presence: true, length:{maximum: 255},
                     format: {with: ValidEmailRegEx},
                     uniqueness:{case_sensitive: false}
                     }
  validates_confirmation_of :password
  validates :password, {presence: true, length: {minimum:6}, allow_nil: true}
end
