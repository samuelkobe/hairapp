class Hairstyle < ActiveRecord::Base
  attr_accessible :count, :name
 
  validates_uniqueness_of :name
  validates :name,  :presence => true
  validates :count, :presence => true
  
end
