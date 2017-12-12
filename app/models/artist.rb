class Artist < ActiveRecord::Base
    validates :name,  :uniqueness => true
    validates :position, :uniqueness => true
    validates_numericality_of :position, :less_than_or_equal_to => 10
end
