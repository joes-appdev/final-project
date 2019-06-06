# == Schema Information
#
# Table name: attendees
#
#  id            :integer          not null, primary key
#  meeting_id    :integer
#  connection_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Attendee < ApplicationRecord
    belongs_to :meeting
    belongs_to :connection
end
