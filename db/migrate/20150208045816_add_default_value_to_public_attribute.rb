class AddDefaultValueToPublicAttribute < ActiveRecord::Migration
  def up
    change_column :topics, :public, :boolean, :default => true
  end

  def down
    change_column :topics, :public, :boolean, :default => nil
  end
end
