class GyanarthIsRoleBoundAndCool < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
        t.references :role, :user
  end

  def self.down
    drop_table     :roles_users
  end
  end
end
