buf = Dir.pwd
filename_in = buf + "/in.epp"
filename_out = buf + "/out.epp"
file_in = File.open(filename_in, 'r')
file_out = File.open(filename_out, 'w')

#contents of the file
contents = file_in.read
#contents.force_encoding('UTF-8')

regex_outer = /\"kw-faktura\",,\"zwrot\skaucji/
regex_inner = /kw-faktura/
buffer = "\"kw-faktura\",,\"zwrot kaucji"
buffer.gsub!(regex_inner, "KAUCJA ZWROT")
contents.gsub!(regex_outer, buffer)

file_out.puts contents
file_in.close
file_out.close
