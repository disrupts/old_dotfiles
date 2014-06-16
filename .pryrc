# pryrc at $HOME/.pryrc
# vim: nowrap fdm=marker

# default configs {{{1
Pry.config.editor = "vim"
Pry.config.auto_indent = true
Pry.config.color = true

# Awesome Print   {{{1
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print: #{err}"
end
