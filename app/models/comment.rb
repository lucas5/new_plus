class Comment < ApplicationRecord
  belongs_to :new, class_name: 'New', required: false
  belongs_to :video, class_name: 'Video', required: false
  belongs_to :user, class_name: 'User'

  has_one :new, class_name: 'New'
  has_one :video, class_name: 'Video'
end
