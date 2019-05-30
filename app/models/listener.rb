class Listener < ActiveRecord::Base
  has_many :reviews
  has_many :podcasts, through: :reviews

  def review_count
    self.reviews.size
  end

end
