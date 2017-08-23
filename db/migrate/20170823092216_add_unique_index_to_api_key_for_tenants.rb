class AddUniqueIndexToApiKeyForTenants < ActiveRecord::Migration
  def change
    add_index :tenants, :api_key, unique: true
  end
end
