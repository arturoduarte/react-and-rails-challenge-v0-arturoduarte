class AddFavoriteToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :favorite, :boolean, default: false
  end
end
