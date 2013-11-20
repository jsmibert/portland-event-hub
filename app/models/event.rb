class Event < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 5 }
  validates :brief_description, presence: true, length: { minimum: 5 }
  validates :address, :presence => true, length: { :minimum => 5 }

  mount_uploader :image, ImageUploader

  private

	def start_date_is_date?
   		if !start_date.is_a?(Date)
     		errors.add(:start_date, 'must be a valid date') 
   		end
  	end

end