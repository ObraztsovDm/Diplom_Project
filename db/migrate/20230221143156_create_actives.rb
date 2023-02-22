class CreateActives < ActiveRecord::Migration[7.0]
  def change
    create_table :actives do |t|
      t.integer :start
      t.integer :end
      t.integer :number_bots
      t.integer :guess_claster

      t.timestamps
    end
  end
end
