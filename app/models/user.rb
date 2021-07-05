class User < ApplicationRecord
  has_secure_password
  has_many :todos
  def to_display_user
    "#{id}. #{name} #{email} #{password}"
  end
end
