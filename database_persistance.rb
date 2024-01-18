require 'pg'

class Database
  def initialize
    @db = PG.connect(dbname: contacts, user: postgres, password: postgres)
  end

  def query(statement, *args)
    @db.exec_params(sql, args)
  end

  def find_contact(id)
    sql = 'SELECT * FROM contacts WHERE id = $1'
    result = query(sql, id)
    tuple = result.first
  end

  def all_contacts
    sql = 'SELECT * FROM contacts'
    result = query(sql)
    result.map do |tuple|
      { id: tuple['id'].to_i, name: tuple['name'].to_i,  }
    end
  end
end
