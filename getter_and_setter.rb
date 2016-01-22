className = "ShoppingCart"

fields = <<eos
string name;
double price;
int quantity;
eos

#DECLARATION
fields.split("\n").each do |field|
	data = field.gsub(/^\s+/, '').split(" ")
	datatype = data[0]
	name = data[1].gsub(/;\s*$/, '').capitalize
	puts "#{datatype} get#{name}();"
	puts "void set#{name}(#{datatype});"
end


puts "\n\n"

#IMPLENTATION
#prints default constructor
puts "#{className}::#{className}(){\n\n}"

fields.split("\n").each do |field|
	data = field.gsub(/^\s+/, '').split(" ")
	datatype = data[0]
	data_name = data[1].gsub(/;\s*$/, '')
	name = data_name.capitalize
	puts "#{datatype} #{className}::get#{name}(){\n\treturn #{data_name};\n}"
	puts "void #{className}::set#{name}(#{datatype} #{data_name[0]}){\n\t#{data_name} = #{data_name[0]};\n}"
end