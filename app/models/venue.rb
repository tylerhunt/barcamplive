class Venue < ActiveRecord::Base
  has_many :talks, :order => 'starts_at'

  def to_param
    id.to_s + '-' + name.downcase.gsub(/\s/, '-').gsub(/'/, '')
  end
end
