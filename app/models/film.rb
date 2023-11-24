class Film
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::GridFsHelper

  mount_uploader :poster, PosterUploader

  field :title, type: String
  field :year, type: Integer
  field :trailer, type: String
  field :director, type: String
  field :description, type: String
  field :actors, type: Array
  field :genres, type: Array
  field :online_cinemas, type: Array
  field :type_film, type: String, default: 'Полнометражный фильм'

  validates :year, presence: true, numericality: { only_integer: true }, length: { is: 4 }

  before_destroy :delete_image_directory
  before_save :process_genres
  before_save :process_actors
  before_save :process_online_cinemas

  private

  def delete_image_directory
    dir_image_path = poster.current_path

    if File.directory?(File.dirname(dir_image_path))
      FileUtils.rm_rf(File.dirname(dir_image_path))
      dir_image_path
    end
  end

  def process_genres
    self.genres = genres.first.split(',').map(&:strip)
  end

  def process_online_cinemas
    self.online_cinemas = online_cinemas.first.split(',').map(&:strip)
  end

  def process_actors
    self.actors = actors.first.split(',').map(&:strip)
  end
end
