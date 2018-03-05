regex_outer = /\"kp-faktura\",,\"kaucja\sdo/
regex_inner = /kp-faktura/
filename_in = "in.epp"
filename_out = "out.epp"
file_in = File.open(filename_in, 'r')
file_out = File.open(filename_out, 'w')

#contents of the file
contents = file_in.read
#contents.force_encoding('UTF-8')
buffer = "\"kp-faktura\",,\"kaucja do"

buffer.gsub!(regex_inner, "kaucja")
contents.gsub!(regex_outer, buffer)
puts buffer
file_out.puts contents
file_in.close
file_out.close
