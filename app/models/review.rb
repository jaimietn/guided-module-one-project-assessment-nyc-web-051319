class Review < ActiveRecord::Base
  belongs_to :podcast
  belongs_to :listener


  def self.show_all_podcasts_names
    #shows all podcast names that have reviews
    all_review_names = self.all.map do |review|
      review.podcast.name
    end
    all_review_names.uniq.each do |review_name|
      puts review_name
    end
  end

  def self.show_all_reviews_by_podcast(podcast_name)
    #shows all reviews of a given podcast
    filtered_reviews = self.all.select do |review|
      review.podcast.name == podcast_name
    end

    filtered_reviews.each do |filtered_review|
      puts "Review: #{filtered_review.content} - by #{filtered_review.listener.name}."
      #returns content of filtered podcasts
    end
  end

  def self.show_all_reviews_by_listener(listener)
    user_reviews = self.where(listener_id: listener.id)
    user_reviews.map do |user_review|
      puts "#{user_review.id}. #{user_review.podcast.name}: Review: #{user_review.content}."
    end
  end

  def self.user_edit_review(review_id, new_content)
    edit_review = Review.find_by(id: review_id)
      if edit_review
        edit_review.update(content: new_content)
      end
    end

  def self.user_delete_review(review_id)
    delete_review = Review.find_by(id: review_id)
      if delete_review
        delete_review.destroy
      end
    end
end #end class
