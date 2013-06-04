class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :etiqueta

      t.timestamps
    end
  end
end
