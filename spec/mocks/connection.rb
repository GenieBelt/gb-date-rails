class GBDateConnection
  def self.sqlite
    ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: ':memory:',
        pool: 5,
        timeout: 1000
    )
  end

  def self.postgres
    ActiveRecord::Base.establish_connection(
        adapter: 'postgresql',
        database: 'gb_date_test',
        host: 'localhost',
        pool: 5,
    )
  end

  def self.mysql
    ActiveRecord::Base.establish_connection(
        adapter: 'mysql2',
        database: 'gb_date_test',
        encoding: 'utf8',
        host: 'localhost',
        pool: 5
    )
  end
end
