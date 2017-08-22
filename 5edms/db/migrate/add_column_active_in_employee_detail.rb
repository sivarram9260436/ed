class AddColumnActiveInEmployeeDetail < ActiveRecord::Migration
   def self.up
   	    add_column :employee_details, :active, :string, :default =>"Active"
   end

   def self.down
         drop_column :employee_details, :active
   end
end         	    
