class AddNoUsersToCoupons < ActiveRecord::Migration
  def self.up
    add_column :coupons, :no_users, :integer , :default => 0
  end

  def self.down
    remove_column :coupons, :no_users
  end
end
