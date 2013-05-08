class Customer
  attr_reader :id, :datasource

  def initialize(id, datasource)
    @id = id
    @datasource = datasource
  end

  def first
    value = process datasource.get_first_value(id), datasource.get_first_datatype(id)
    "First: #{value}"
  end

  def last
    value = process datasource.get_last_value(id), datasource.get_last_datatype(id)
    "Last: #{value}"
  end

  def email
    value = process datasource.get_email_value(id), datasource.get_email_datatype(id)
    "Email: #{value}"
  end

  def age
    value = process datasource.get_age_value(id), datasource.get_age_datatype(id)
    "Age: #{value}"
  end

  private

  def process(value, type)
    type.to_sym == :string ? "'#{value}'" : value
  end

end
