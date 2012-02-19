class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.references :person
      t.text :content

      t.timestamps
    end
    add_index :projects, :person_id
  end
end
