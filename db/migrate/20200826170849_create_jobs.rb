class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :slug
      t.string :title
      t.string :company
      t.string :link

      t.belongs_to :search

      t.timestamps
    end
  end
end
