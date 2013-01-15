class Attribute < ActiveRecord::Base
  validates_presence_of :name, :type, :attrID
  validates_uniqueness_of :attrID
end
