class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :instrument
      t.string :title
      t.string :composer
      t.integer :diffculty
      t.string :link
    end
  end
end
