class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user                        ,null: false, foreign_key: true
      t.string     :item_name                   ,null: false 
      t.integer    :price                       ,null: false
      t.integer    :category_id                 ,null: false
      t.integer    :condition_id                ,null: false
      t.integer    :delivery_price_id           ,null: false
      t.integer    :prefecture_id               ,null: false
      t.integer    :standard_send_date_id       ,null: false
      t.text       :content                     ,null: false
      t.timestamps
    end
  end
end
