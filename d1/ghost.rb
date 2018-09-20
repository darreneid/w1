def import(file)
  dict = []
  File.foreach(file) { |line| dict << line[0...-1] }
  dict
end

dictionary = import("./data/dictionary.txt")
