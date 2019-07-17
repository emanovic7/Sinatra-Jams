class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |a|
      a.string :name
      a.integer :age
      a.string :bio
    end
  end
end
