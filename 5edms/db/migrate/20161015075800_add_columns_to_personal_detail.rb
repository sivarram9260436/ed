class AddColumnsToPersonalDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :personal_details, :passport_number, :string
    add_column :personal_details, :linkedin_url, :string
    add_column :personal_details, :facebook_url, :string
    add_column :personal_details, :twitter_url, :string
  end
end
