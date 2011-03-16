require 'benchmark'
require 'scorer'

iterations = 4000
puts "Benchmarking #{iterations} iterations..."
Benchmark.bmbm do |x|
  x.report("one letter") do
    iterations.times { "hello world".score("h") }
  end
  x.report("two letters") do
    iterations.times { "hello world".score("hw") }
  end
  x.report("full match") do
    iterations.times { "hello world".score("hello world") }
  end
  x.report("13 char / 32 char") do
    iterations.times do
      "hello any world that will listen".score("hlo wrdthlstn")
    end
  end
  x.report("70 char / 446 char") do
    iterations.times do
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.".score("Lorem i dor coecadipg et, Duis aute irure dole nulla. qui ofa mot am l")
    end
  end
end
