class Contact < ActiveRecord::Base
  validates :name, :phone, :email, :address, presence: :true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  belongs_to :user
  belongs_to :group

  def deleted!
   update(deleted: 1)
  end

  def deleted?
    deleted
  end
end
