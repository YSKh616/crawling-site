class CreateCrawlings < ActiveRecord::Migration[5.0]
  def change
    create_table :crawlings do |t|
      t.string  :title
      
      t.timestamps
    end
  end
end
