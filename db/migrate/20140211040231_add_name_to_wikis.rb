class AddNameToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :name, :string
  end
end
