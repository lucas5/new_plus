class TagNew < ApplicationRecord
  self.table_name = 'tag_news'

  belongs_to :tag, class_name: 'Tag'
  belongs_to :new, foreign_key: :new_id, class_name: 'New', required: false
end
