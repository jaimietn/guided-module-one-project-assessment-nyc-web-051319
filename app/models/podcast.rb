class Podcast < ActiveRecord::Base
  has_many :reviews
  has_many :listeners, through: :reviews


  def self.return_all_podcast_names
    self.all.map do |podcast|
      podcast.name
    end.uniq
  end

  def self.match_pod_id_to_name(podcast_id)
    self.all.find do |podcast|
      podcast.id == podcast_id
    end.name
  end

  def self.match_pod_ids_to_names(podcast_ids)
    podcast_names = []
    podcast_ids.each do |id|
      names_of_podcasts << self.match_pod_id_to_name(id)
    end
    podcast_names
  end
end #end of class
