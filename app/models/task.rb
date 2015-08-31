class Task < ActiveRecord::Base
  belongs_to :project
  validates :content, :deadline, presence: true
  
  def completed?
  	!completed_at.blank?
  end
end
