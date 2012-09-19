class AddHairstyleIdToBlacklist < ActiveRecord::Migration
  def change
    add_column :blacklists, :hairstyle_id, :int
  end
end
