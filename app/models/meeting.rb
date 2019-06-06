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
    has_many :attendees, :dependent => :destroy
    belongs_to :location

end
