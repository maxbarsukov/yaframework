# frozen_string_literal: true

require "pg"

class Database
  def self.connect(db_name)
    pg_conn = PG.connect(dbname: db_name)
    new(pg_conn)
  end

  def initialize(pg_conn)
    @pg_conn = pg_conn
  end

  def exec(sql)
    @pg_conn.exec(sql).to_a
  end
end
