class CreateTableDocument < ActiveRecord::Migration
  def up
  	create_table :documents do |t|
  	t.string :document_name,:document_path
  	t.boolean :status,:default=>true
  	end
  end

  def down
  	drop_table :documents
  end
end
