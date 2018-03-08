Dir.chdir("..")
files = Dir.glob("*.epp")
files.each do |x|
  file_in = File.open(x, 'r')
  contents = file_in.read
  file_in.close
  filename_in = x.gsub(/\.epp/, " - OLD.epp")
  File.rename(x, filename_in)
  file_out = File.open(x, 'w')

#DO STH
  regex_outer = /\"kp-faktura\",,\"kaucja\sdo/
  regex_inner = /kp-faktura/
  buffer = "\"kp-faktura\",,\"kaucja do"
  buffer.gsub!(regex_inner, "kaucja")
  contents.gsub!(regex_outer, buffer)

  regex_outer = /\"kw-faktura\",,\"zwrot\skaucji/
  regex_inner = /kw-faktura/
  buffer = "\"kw-faktura\",,\"zwrot kaucji"
  buffer.gsub!(regex_inner, "KAUCJA ZWROT")
  contents.gsub!(regex_outer, buffer)

  regex_outer = /ING-K\",,\"Karty/
  regex_inner = /ING-K/
  buffer = "ING-K\",,\"Karty"
  buffer.gsub!(regex_inner, "ING-O")
  contents.gsub!(regex_outer, buffer)
#DONE

  file_out.puts contents
  file_out.close

end
