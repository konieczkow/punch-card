require 'active_record'

ActiveRecord::Base.establish_connection

ActiveRecord::Base.connection_pool.with_connection do |connection|
  connection.execute <<-SQL
    CREATE TABLE statuses (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255)
    );
  SQL
  connection.execute <<-SQL
    INSERT INTO statuses ( name ) VALUES ( 'Out' ) , ( 'In' );
  SQL
  connection.execute <<-SQL
    CREATE TABLE punch_cards (
      id SERIAL PRIMARY KEY,
      user_id VARCHAR(255) NOT NULL,
      status_id INTEGER NOT NULL DEFAULT 1,
      optional_text TEXT
    );
  SQL
end
