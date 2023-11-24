class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :poster, PosterUploader
  mount_uploaders :photos, PhotoUploader

  field :title, type: String
  field :content, type: String
  field :date, type: Date, default: DateTime.now.strftime("%d.%m.%Y")
  field :photos, type: Array, default: []
end
