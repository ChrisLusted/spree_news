class Spree::Post < ActiveRecord::Base
  validates_presence_of :description
#  validates_length_of :description, :maximum => 150

  scope :published, lambda { where(:published => true) }
  
  attr_accessible :title, :description, :published
  
  def rendered_desc
    RDiscount.new(description.to_s).to_html.html_safe
  end
end
