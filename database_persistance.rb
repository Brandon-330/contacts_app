require 'pg'

class DatabasePersistance
  def initialize
    @db = PG.connect(dbname: 'phone_contacts', user: 'postgres', password: 'postgres')
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
      { 
        id: tuple['id'].to_i, 
        name: tuple['name'].to_i, 
        phone_number: tuple['phone_number'].to_i, 
        email: tuple['email_address'],
        description: tuple['description']
        #category: find_category(tuple[:id].to_i)
     }
    end
  end
end
