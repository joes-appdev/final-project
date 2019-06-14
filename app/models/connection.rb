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
   
   def meet
      return Meeting.where({:connections_id => self.id})
   end
   
   def company
      return Company.where({:id => self.company_id})
   end
   
   def location
      return Location.where({:id => self.location_id})
   end
   
# has_many :meetings, :foreign_key => "connections_id", :dependent => :destroy
#  belongs_to :company
# belongs_to :location



    
end
