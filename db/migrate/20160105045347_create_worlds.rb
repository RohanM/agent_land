class CreateWorlds < ActiveRecord::Migration[5.0]
  def change
    create_table :worlds do |t|
      t.string :name
      t.integer :data, array: true, default: []
    end
  end
end
