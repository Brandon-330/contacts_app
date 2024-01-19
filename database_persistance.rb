require 'pg'

class DatabasePersistance
  def initialize
    @db = PG.connect(dbname: 'phone_contacts', user: 'postgres', password: 'postgres')
  end

  private

  def query(statement, *args)
    @db.exec_params(statement, args)
  end

  public

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
        name: tuple['name'], 
        phone_number: tuple['phone_number'].to_i, 
        email: tuple['email_address'],
        description: tuple['description'],
        category: find_category_type(tuple['category_id'].to_i)
      }
    end
  end

  private

  def find_category_type(category_id)
    sql = 'SELECT type FROM categories WHERE $1'
    result = query(sql, category_id)
    tuple = result.first
    tuple['type']
  end
end
