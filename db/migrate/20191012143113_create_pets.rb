class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.references :person, foreign_key: true
      t.string :recomendation

      t.timestamps
    end
  end
end
