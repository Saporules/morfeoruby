class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :contenido
      t.string :ip
      t.integer :privacidad

      t.timestamps
    end
  end
end
