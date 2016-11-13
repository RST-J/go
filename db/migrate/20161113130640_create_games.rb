class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :black, foreign_key: {to_table: :users}, index: true
      t.references :white, foreign_key: {to_table: :users}, index: true
      t.string :name, index: true
      t.integer :board_size, index: true

      t.timestamps
    end

  end
end
