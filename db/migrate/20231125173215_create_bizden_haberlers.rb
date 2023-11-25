class CreateBizdenHaberlers < ActiveRecord::Migration[7.1]
  def change
    create_table :bizden_haberlers do |t|
      t.text :header
      t.string :image
      t.text :body
      t.string :source

      t.timestamps
    end
  end
end
