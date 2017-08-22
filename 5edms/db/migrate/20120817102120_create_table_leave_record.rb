class CreateTableLeaveRecord < ActiveRecord::Migration
   def up
    create_table :leave_records do |t|
     t.integer :leave_type_id,:no_of_days,:employee_detail_id,:year
     t.date :from_date,:to_date
     t.string :reason
     t.string :status, :null => false, :default => 'Pending'
    end
  end

  def down
    drop_table :leave_records
  end
end
