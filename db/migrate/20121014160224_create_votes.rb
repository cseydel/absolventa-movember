class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :bro_id
      t.integer :moustache_id
      t.decimal :money_value
      t.timestamps
    end
  end
end
