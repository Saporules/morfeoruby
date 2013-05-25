class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :contenido
      t.string :ip
      t.boolean :publico
      t.boolean :privado
      t.boolean	:anonimo

      t.timestamps
    end
  end
end
