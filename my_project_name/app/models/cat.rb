require 'action_view'
require 'date'

# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = %w(black white red blue)
  
  validates :color, inclusion: { in: COLORS}
  validates :sex, inclusion: { in: %w(M F)}
  validates :birth_date, :description, presence: true
  
  def age
    # birth_year = :birth_date.to_s[0..3].to_i
    # todays_year = Date.today.to_s[0..3].to_i

    # todays_year - birth_year 
    time_ago_in_words(birth_date)
  end

  

end
