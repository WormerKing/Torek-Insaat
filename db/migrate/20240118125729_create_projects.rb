class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title,null: false
      t.date :start_date,null: false
      t.date :end_date
      t.text :body,null: false
      t.string :image,null: false
      t.string :status,null: false

      t.timestamps
    end
  end
end
