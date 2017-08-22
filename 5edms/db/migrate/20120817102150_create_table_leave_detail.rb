class CreateTableLeaveDetail < ActiveRecord::Migration
   def up
      create_table :leave_details do |t|
      t.integer :employee_detail_id
      t.integer :leave_type_id
      t.integer :total_leaves
      t.integer :balance
      t.integer :availed
      t.integer :carry_forward
      t.integer :year
      t.integer :total_leave_balance
      end
  end

  def down
       drop_table :leave_details
  end
end
