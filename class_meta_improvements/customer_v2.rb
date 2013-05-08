class Customer
  attr_reader :id, :datasource

  def initialize(id, datasource)
    @id = id
    @datasource = datasource
  end

  def first
    field :first
  end

  def last
    field :last
  end

  def email
    field :email
  end

  def age
    field :age
  end

  private

  def field(fieldname)
    value = process datasource.send("get_#{fieldname}_value", id), datasource.send("get_#{fieldname}_datatype", id)
    "#{fieldname.capitalize}: #{value}"
  end

  def process(value, type)
    type.to_sym == :string ? "'#{value}'" : value
  end

end
