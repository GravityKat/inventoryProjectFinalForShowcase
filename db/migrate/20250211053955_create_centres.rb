class CreateCentres < ActiveRecord::Migration[8.0]
  def change
    create_table :centres do |t|
      t.string :name

      t.timestamps
    end
  end
end
