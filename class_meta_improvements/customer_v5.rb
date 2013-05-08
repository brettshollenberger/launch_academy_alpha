class Customer
  attr_reader :id, :datasource

  def initialize(id, datasource)
    @id = id
    @datasource = datasource
  end

  private

  def method_missing(methodname, *args, &block)
    super unless @datasource.respond_to? "get_#{methodname}_value"
    value = process datasource.send("get_#{methodname}_value", id), datasource.send("get_#{methodname}_datatype", id)
    "#{methodname.capitalize}: #{value}"
  end

  def process(value, type)
    type.to_sym == :string ? "'#{value}'" : value
  end

end
