class AddNameToCategories < ActiveRecord::Migration[5.1]
  def change
  	# categories.name was already added when the categories table was initially created,
  	# so this is no longer necessary.
  	
    #add_column :categories, :name, :string
  end
end
