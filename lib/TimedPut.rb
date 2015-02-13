def tputs(&block)
  start=Time.now
  puts "Result:#{yield}"
  puts "Execution time:#{Time.now-start}"
end
