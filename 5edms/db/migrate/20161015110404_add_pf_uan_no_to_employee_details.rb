class AddPfUanNoToEmployeeDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :employee_details, :pf_uan_no, :string
  end
end
