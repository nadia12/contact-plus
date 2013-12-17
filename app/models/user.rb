class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, 
                              uniqueness: {case_sensitive: false}, 
                              length: { in:6..20}

  validates :name, :phone, presence: true

  has_many :contacts

end
