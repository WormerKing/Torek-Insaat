class CreateBasindanHaberlers < ActiveRecord::Migration[7.1]
  def change
    create_table :basindan_haberlers do |t|
      t.text :header
      t.string :image
      t.text :body
      t.string :source

      t.timestamps
    end
  end
end
