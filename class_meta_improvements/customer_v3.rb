class Customer
  attr_reader :id, :datasource

  def initialize(id, datasource)
    @id = id
    @datasource = datasource
  end

  def self.has_field(fieldname)
    define_method fieldname do
      value = process datasource.send("get_#{fieldname}_value", id), datasource.send("get_#{fieldname}_datatype", id)
      "#{fieldname.capitalize}: #{value}"
    end
  end

  has_field :first
  has_field :last
  has_field :email
  has_field :age

  private

  def process(value, type)
    type.to_sym == :string ? "'#{value}'" : value
  end

end
