class Video < ApplicationRecord
  self.table_name = 'videos'

  has_many :tag_videos, class_name: 'TagVideo', dependent: :destroy
  has_many :tags, through: :tag_video, class_name: 'Tag', source: :tag, dependent: :destroy

  scope :not_excluded, -> { where(deleted: false); order(:id) }

  accepts_nested_attributes_for :tag_videos, allow_destroy: true
end
