class CreateFooTable < ActiveRecord::Migration
  def up
    create_table :foos do |t|
      t.date :foo_date
      t.datetime :foo_datetime
      t.time :foo_time
      t.timestamp
    end
    puts 'ran up method'
  end

  def down
    drop_table :foos
    puts 'ran down method'
  end
end