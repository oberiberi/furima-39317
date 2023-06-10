class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.references :buy                    ,null: false, foreign_key: true
      t.string     :post_code              ,null: false 
      t.string     :prefecture_id          ,null: false 
      t.string     :municipality           ,null: false 
      t.string     :address                ,null: false 
      t.string     :building_name          ,null: false 
      t.string     :telephon_number        ,null: false 
      t.timestamps
    end
  end
end