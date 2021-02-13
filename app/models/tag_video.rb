class TagVideo < ApplicationRecord
  self.table_name = 'tag_videos'

  belongs_to :tag, class_name: 'Tag'
  belongs_to :video, foreign_key: :video_id, class_name: 'Video', required: false
end
