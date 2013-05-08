class Customer
  attr_reader :id, :datasource

  def initialize(id, datasource)
    @id = id
    @datasource = datasource
    @datasource.methods.grep(/^get_(.*)_value/) { Customer.has_field $1 }
  end

  def self.has_field(fieldname)
    define_method fieldname do
      value = process datasource.send("get_#{fieldname}_value", id), datasource.send("get_#{fieldname}_datatype", id)
      "#{fieldname.capitalize}: #{value}"
    end
  end

  private

  def process(value, type)
    type.to_sym == :string ? "'#{value}'" : value
  end

end
