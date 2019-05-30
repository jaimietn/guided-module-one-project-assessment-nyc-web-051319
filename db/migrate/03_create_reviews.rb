class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :podcast_id
      t.integer :listener_id
      t.text :content
    end
  end
end
