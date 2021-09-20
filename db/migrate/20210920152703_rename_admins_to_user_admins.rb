class RenameAdminsToUserAdmins < ActiveRecord::Migration[6.1]
  def change
    def self.up
      rename_table :admins, :useradmins
    end
  
    def self.down
      rename_table :useradmins, :admins
    end
  end
end
