require_relative("../db/sql_runner")
require_relative("film.rb")


class Customer
  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      customer = SqlRunner.run(sql, values)

    end

    def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)

    end


    def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1"

    values = [@id]
    results = SqlRunner.run(sql, values)
    films = results.map {|film| Film.new(film)}
    return films

    end

    # def enough_funds_for_ticket()
    #   sql = "SELECT * FROM customers (name, funds) = ($1, $2) WHERE funds -= 10"
    #   values = [@name, @funds, @id]
    #   SqlRunner.run(sql, values)
    # end

    # def delete_funds()
    #    sql = "DELETE funds.* FROM customers
    #    INNER JOIN tickets
    #    ON tickets.film_id = films.id
    #    WHERE customer_id = $1"
    #
    #    values = [@funds]
    #    results = SqlRunner.run(sql, values)
    #    films = results.delete {|customer| Customer.new(customer)}
    #    return customers
    # end


    # checks funds avaialble against ticket price,
    #customer1.funds > tickets?
    #[customer funds = - price]
    
    # check how many tickets bought by a customer,
    #customer1.tickets?







end
