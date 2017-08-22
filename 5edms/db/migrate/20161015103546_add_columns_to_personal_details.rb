class AddColumnsToPersonalDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :personal_details, :pf_uan_no, :string
    add_column :personal_details, :string
  end
end
