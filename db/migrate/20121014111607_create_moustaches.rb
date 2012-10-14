class CreateMoustaches < ActiveRecord::Migration
  def change
    create_table :moustaches do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
