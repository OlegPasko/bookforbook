class AddIwant2ToUser < ActiveRecord::Migration
  def change
    add_column :users, :iwant, :text
  end
end
