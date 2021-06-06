class User < ApplicationRecord
    def to_display_user
        
        "#{id}. #{name} #{email} #{password}"
    end
end
