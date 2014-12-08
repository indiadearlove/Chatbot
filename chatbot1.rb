require './colour.rb'

def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  
=begin
  
  if response = 'quit'

=end  

  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye'.red, 
              'sayonara' => 'sayonara'.red, 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}'.red, 
              'I love (.*)' => 'I love %{c1} too'.red, 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'.red,
              'I hate (.*)' =>'What\'s wrong with %{c1}?'.red,
              'Let\'s go to (.*)' =>'I\'m a computer, I can\'t go to %{c1}'.red,
              'I am (.*)' =>'Nice to meet you %{c1}, I am the chatbot'.red,
              'Hello' => 'Hi'.red,
              'Who are you?' => 'The chatbot'.red   
            }

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}".red
while(input = gets.chomp) do
  puts get_response(input)
end

