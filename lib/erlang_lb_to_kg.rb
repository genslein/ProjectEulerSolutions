
def format_weights(objects_and_pounds)
  @converted_list = convert_list_to_kg(objects_and_pounds)
  print_converted_list(@converted_list)
  print_max_and_min_objects(@converted_list.max, @converted_list.min)
end

def print_max_and_min_objects(max, min)
  puts "Max weight was #{max[0]} c in #{max[1]}"
  puts "Min weight was #{min[0]} c in #{min[1]}"
end

def convert_list_to_kg(objs_to_convert)
  objs_to_convert.map { |key, val| [key, val / 0.45359237] }.to_h
end

def print_converted_list(converted_list)
  converted_list.each do |key, value|
    printf("%-.15f c %s\n", value, key)
  end
end

format_weights({"desk" => 195, "chair" => 85, "person" => 205})