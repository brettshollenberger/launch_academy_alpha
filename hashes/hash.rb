# Solving for strange edge cases swapping keys and values in hashes

y = {
  home: 'Boston',
  office: 'Boston',
  cottage: 'Portland',
  getaway: 'Portland',
  staycation: 'Boston'
}

new_hash = {}

y.each do |k, v|
  if new_hash.has_key?(v)
    if new_hash[v].is_a?(Array)
      new_hash[v].push(k)
    else
      tmp = new_hash[v]
      new_hash[v] = [tmp]
      new_hash[v].push(k)
    end
  else
    new_hash[v] = k
  end
end

puts new_hash
