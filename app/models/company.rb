# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  company    :string
#  location   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
    
    has_many :connections, :dependent => :destroy

end
