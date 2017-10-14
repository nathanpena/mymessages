class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.datetime :occured_at
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
