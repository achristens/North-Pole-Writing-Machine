require 'erb'

kids_data   = File.read('data/kids-data.txt')
invoice_letter = File.read('templates/invoice_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name            = kid_data_array[0]
  gender          = kid_data_array[1]
  behavior        = kid_data_array[2]
  toys            = kid_data_array[3..8]
  house_value     = kid_data_array[13]
  street_address  = kid_data_array[9..11]
  postal_code     = kid_data_array[12]
  toy_value = 0
    if house_value.to_i > 1000000
      toy_value = 1000
    elsif house_value.to_i >= 200000 && house_value.to_i < 1000000
      toy_value = 100
    end
  toy_value

  filename    = 'letters/invoices/' + name + '.txt'
  letter_text = ERB.new(invoice_letter, nil, '-').result(binding)


  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
