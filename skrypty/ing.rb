buf = Dir.pwd
filename_in = buf + "/in.epp"
filename_out = buf + "/out.epp"
file_in = File.open(filename_in, 'r')
file_out = File.open(filename_out, 'w')

#contents of the file
contents = file_in.read
#contents.force_encoding('UTF-8')

regex_outer = /ING-K\",,\"Karty/
regex_inner = /ING-K/
buffer = "ING-K\",,\"Karty"
buffer.gsub!(regex_inner, "ING-O")
contents.gsub!(regex_outer, buffer)

file_out.puts contents
file_in.close
file_out.close
