require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.



class SQLObject
  def self.columns
    return @col unless @col.nil?
    @col = DBConnection.execute2(<<-SQL)
      select 
        *
      from
        #{self.table_name}
      limit
        1
    SQL
    @col = @col[0].map(&:to_sym)
  end

  def self.finalize!
      self.columns.each do |col|
        define_method(col) do 
          attributes[col]
        end
        define_method("#{col}=") do 
          |value| attributes[col] = value
        end
      end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name.nil?
      self.to_s.tableize
    else
      @table_name
    end
  end

  def self.all
    # return @row unless @row.nil?
    result = DBConnection.execute(<<-SQL)
      select 
        *
      from
        #{self.table_name}
    SQL
    self.parse_all(result)
  end

  def self.parse_all(results)
      results.map do |hash|
        self.new(hash)
      end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      select 
        *
      from
        #{self.table_name}
      where
        id = ?
    SQL
    self.parse_all(result)[0]
  end

  def initialize(params = {})
      params.each do |k,v|
        attr_name = (k.to_sym)
        if !self.class.columns.include?(attr_name)
          raise "unknown attribute '#{attr_name}'"
        else
          self.send("#{attr_name}=", v)
      end
    end
  end
  def attributes
    @attributes ||= {}
  end

  def attribute_values
      arr = []
      @attributes.each {|k,v| arr << v}
      arr
  end

  def insert
      
  end

  def update
    # ...
  end

  def save
    # ...
  end
end


# .joins(:actors)
# .where(actors: {name: 'meg ryan'})