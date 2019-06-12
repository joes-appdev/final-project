# == Schema Information
#
# Table name: connections
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  location_id :integer
#  photo       :string
#  name        :string
#  linkein     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Connection < ApplicationRecord
   has_many :attendees, :dependent => :destroy
 belongs_to :company
belongs_to :location



def location
   return Location.where({:id => self.location_id})
end


    
end
