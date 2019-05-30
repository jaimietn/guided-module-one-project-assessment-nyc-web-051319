class CreateListeners < ActiveRecord::Migration[5.2]
  def change
    create_table :listeners do |t|
      t.string :name
    end
  end
end
