class CreateOfficeTypes < ActiveRecord::Migration
  def self.up
    create_table :office_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
