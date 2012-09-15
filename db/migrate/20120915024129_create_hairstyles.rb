class CreateHairstyles < ActiveRecord::Migration
  def change
    create_table :hairstyles do |t|
      t.string :name
      t.integer :count

      t.timestamps
    end
  end
end
