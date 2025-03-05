class CreateSignatures < ActiveRecord::Migration[8.0]
  def change
    create_table :signatures do |t|
      t.references :user, null: false, foreign_key: true
      t.text :signature

      t.timestamps
    end
  end
end
