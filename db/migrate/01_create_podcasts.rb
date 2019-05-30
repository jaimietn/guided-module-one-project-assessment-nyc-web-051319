class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :genre
      t.string :host
      t.text :description
      t.integer :year_started
      t.boolean :still_active
      t.string :day_released
    end
  end
end
