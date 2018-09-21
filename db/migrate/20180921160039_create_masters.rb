class CreateMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :masters do |t|
      t.text :name
      t.timestamp
    end

    Master.create :name => 'Master Santehnik'
    Master.create :name => 'Sergey Buharik'
    Master.create :name => 'Galka Krivoruchka'

  end
end
