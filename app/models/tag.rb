class Tag < ApplicationRecord
  self.table_name = 'tags'

  has_many :tag_videos, class_name: 'TagVideo'
  has_many :videos, class_name: 'Video'

  has_many :tag_news, class_name: 'TagNew'
  has_many :news, class_name: 'New'

end
