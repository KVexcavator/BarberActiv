class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.text :name
      t.text :pfone
      t.text :datestamp
      t.text :master
      t.text :color
      t.timestamps
    end
  end
end
