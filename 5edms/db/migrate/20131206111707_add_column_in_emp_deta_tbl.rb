class AddColumnInEmpDetaTbl < ActiveRecord::Migration
  def self.up
    add_column :employee_details, :office_type, :integer
  end

  def self.down
    remove_column :employee_details, :office_type
  end
end
