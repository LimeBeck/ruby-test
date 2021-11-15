class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum send_digest_mode: [:WEEKLY, :DAILY, :NONE]

  before_create do
    self.send_digest_mode = :WEEKLY
  end
end
