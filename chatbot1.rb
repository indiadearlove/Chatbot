def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
              'I hate (.*)' =>'What\'s wrong with %{c1}?',
              'Let\'s go to (.*)' =>'I\'m a computer, I can\'t go to %{c1}'
              'I am (.*)' =>'Nice to meet you %{c1}, I am the chatbot'
              'Hello' => 'Hi'
              'Who are you?' => 'The chatbot'
            }

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"
while(input = gets.chomp) do
  puts get_response(input)
end

