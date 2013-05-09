a = [:k1, :k2]
b = ['a']
c = ['a']
h = {k1: b, k2: c}

h.each do |k, v|
    v.push('b')
end

h.each do |has|
  puts has
end
