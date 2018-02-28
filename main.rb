

regex_outer = /ING-K\",,\"Karty/
regex_inner = /ING-K/
filename_in = "bartki.epp"
filename_out = "ttest.epp"
file_in = File.open(filename_in, 'r')
file_out = File.open(filename_out, 'w')
contents = file_in.read
#contents.force_encoding('UTF-8')
buffer = "ING-K\",,\"Karty"
buffer.gsub!(regex_inner, "ING-O")
contents.gsub!(regex_outer, buffer)
puts buffer
file_out.puts contents
#puts contents
# 1,275
# ING-K",,"Karty
# ING-M",,
