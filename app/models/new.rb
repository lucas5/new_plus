class New < ApplicationRecord
  self.table_name = 'news'

  has_many :tag_news, class_name: 'TagNew', dependent: :destroy
  has_many :tags, through: :tag_new, class_name: 'Tag', source: :tag, dependent: :destroy
  has_many :comments, class_name: 'Comment'

  scope :news_search, -> (search) do
    search = search.downcase if search.present?
    where(search.present? ? ['LOWER(description) LIKE ?', "%#{search}%"] : [])
  end

  accepts_nested_attributes_for :tag_news, allow_destroy: true
end
