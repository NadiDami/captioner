class Tag < ActiveRecord::Base
  has_and_belongs_to_many :submissions

  def to_param
    slug
  end
end
