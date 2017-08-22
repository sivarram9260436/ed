class CreateTableLeaveType < ActiveRecord::Migration
  def up
      create_table :leave_types do |t|
      t.string :leave_types
      t.integer :total_leaves
      end
  end

  def down
    drop_table :leave_types
  end
end
