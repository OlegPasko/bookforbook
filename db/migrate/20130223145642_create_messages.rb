class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :book_id
      t.integer :user_id
      t.integer :recepient_id

      t.timestamps
    end
  end
end
