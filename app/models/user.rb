class User < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :courses, through: :enrollments


def full_name
   return "#{self.first_name} #{self.last_name}"
end



end
