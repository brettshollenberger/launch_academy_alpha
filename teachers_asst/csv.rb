require 'csv'
x = File.read(File.join(File.dirname(__FILE__), 'students.csv'))

print CSV.parse(x)
