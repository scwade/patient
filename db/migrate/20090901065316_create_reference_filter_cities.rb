class CreateReferenceFilterCities < ActiveRecord::Migration
  def self.up
    create_table :reference_filter_cities do |t|
      t.string :description,  :null => false,  :limit => 60

      t.timestamps
    end
  end

  def self.down
    drop_table :reference_filter_cities
  end
end
