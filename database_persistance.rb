require 'pg'

class Database
  def initialize
    @db = PG.connect(dbname: contacts, user: postgres, password: postgres)
  end

  def find(name)

  end
end
