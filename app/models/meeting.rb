# == Schema Information
#
# Table name: meetings
#
#  id             :integer          not null, primary key
#  connections_id :integer
#  date           :date
#  meeting_notes  :text
#  location_id    :integer
#  user_id        :integer
#  meeting_type   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Meeting < ApplicationRecord
    belongs_to :user
belongs_to :connections, :class_name => "Connection"
belongs_to :location
    
    
def connection
    return Connection.where({:id => self.connections_id})
end

def location
    return Location.where({:id => self.location_id})
end





end
