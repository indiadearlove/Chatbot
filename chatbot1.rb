require './colour.rb'

def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  
=begin
  
  if response = 'quit'
  response.'quit' ? 
=end  
  response.nil? ? 'bot : sorry?'.red : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bot : bye'.red, 
              'sayonara' => 'bot : sayonara'.red, 
              'the weather is (.*)' => 'bot : I hate it when it\'s %{c1}'.red, 
              'I love (.*)' => 'bot : I love %{c1} too'.red, 
              'I groove to (.*) and (.*)' => 'bot : I love %{c1} but I hate %{c2}'.red,
              'I hate (.*)' =>'bot : What\'s wrong with %{c1}?'.red,
              'Let\'s go to (.*)' =>'bot : I\'m a computer, I can\'t go to %{c1}'.red,
              'I am (.*)' =>'bot : Nice to meet you %{c1}, I am the chatbot'.red,
              'Hello' => 'bot : Hi'.red,
              'Who are you?' => 'bot : The chatbot'.red   
            }

puts "bot : Hello, what's your name?".red
name = gets.chomp
puts "bot : Hello #{name}".red
while(input = gets.chomp) do
  puts get_response(input)
end

