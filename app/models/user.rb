class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :evaluation_form, :dependent => :destroy
  # validates :name,:cnic,:join_date, :role, presence: true
  # validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  has_many :employees, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User", optional: true

end
