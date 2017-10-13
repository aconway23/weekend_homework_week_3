require_relative("../db/sql_runner")

class Film
  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ( $1, $2 ) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run( sql, values ).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all()
      sql = "DELETE FROM films"
      values = []
      film = SqlRunner.run(sql, values)

    end



end
