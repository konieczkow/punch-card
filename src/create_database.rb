require 'sqlite3'

database = SQLite3::Database.new 'punch-card.db'

database.execute <<-SQL
  CREATE TABLE statuses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255)
  );
SQL
database.execute <<-SQL
  INSERT INTO statuses ( name ) VALUES ( 'Out' ) , ( 'In' );
SQL
database.execute <<-SQL
  CREATE TABLE punch_cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id VARCHAR(255) NOT NULL,
    status_id INTEGER NOT NULL DEFAULT 1,
    optional_text TEXT
  );
SQL

