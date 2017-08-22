class CreateTableEmployeeDetail < ActiveRecord::Migration
  def up
    create_table :employee_details do |t|

      t.string :title,:emp_name,:last_name,:middle_name,:pan_number,:pf_number,:gender,:martial_status
      t.date :dob,:date_of_join
      t.integer :role_id
      t.string :contact_no,:official_mailid,:password,:manager_mailid,:empl_id,:tl_mailid

      t.timestamps
  end
  end
  def down
    drop_table :employee_details
  end
end
