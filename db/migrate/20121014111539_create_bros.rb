class CreateBros < ActiveRecord::Migration
  def change
    create_table :bros do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
