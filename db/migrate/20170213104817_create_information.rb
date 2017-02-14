class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.string :name
      t.text :contents
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
