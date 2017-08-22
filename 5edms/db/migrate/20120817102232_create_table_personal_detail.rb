class CreateTablePersonalDetail < ActiveRecord::Migration
 def up
    create_table :personal_details do |t|

      t.integer :employee_detail_id,:pg_year,:ug_year,:diploma_year,:puc_year,:tenth_year

      t.date :anniversary_date,:p_dob

      t.string :local_address,:permanent_address,:changeof_address,:personalmail_id,:emergency_contact,:blood_group

      t.string :father_name,:mother_name,:company_name,:designation,:experience,:pg,:ug,:diploma,:puc,:tenth,:guardian,:relationship,:company_name2,:designation2,:experience2

      t.timestamps
  end
  end

  def down
    drop_table :personal_details
  end
end
