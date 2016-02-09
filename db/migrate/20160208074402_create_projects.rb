class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_desc
      t.string :project_type

      t.timestamps null: false
    end
  end
end
