class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :brief_description
      t.date :start_date
      t.date :end_date
      t.timestamp :date_created
      t.time :time_start
      t.time :time_end
      t.text :address
      t.text :long_description
      t.string :cost_range_start
      t.string :cost_range_end
      t.text :website_url
      t.string :image

      t.timestamps
    end
  end
end
