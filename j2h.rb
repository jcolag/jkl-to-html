require 'kramdown'
require 'liquid'

exit -1 if ARGV.empty?
filename = ARGV[0]

input = File.read filename

template = Liquid::Template.parse(input, error_mode: :strict)
text = template.render('post_url' => 'go')
doc = Kramdown::Document.new(text)
print doc.to_html

