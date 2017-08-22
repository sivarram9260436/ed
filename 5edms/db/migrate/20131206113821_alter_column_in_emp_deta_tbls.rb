class AlterColumnInEmpDetaTbls < ActiveRecord::Migration
  def self.up
    add_column :employee_details, :office_type_id, :integer
    remove_column :employee_details, :office_type
  end

  def self.down
    remove_column :employee_details, :office_type_id
    add_column :employee_details, :office_type, :integer
  end
end
