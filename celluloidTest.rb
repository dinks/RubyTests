require 'celluloid'
require 'open-uri'
require 'cgi'
require 'benchmark'

module Enumerable
  def pmap(&block)
    futures = map { |elem| Celluloid::Future.new(elem, &block) }
    futures.map { |future| future.value }
  end
end

def image_url(color, term)
  url = "http://www.google.com/search?q=#{term}&tbm=isch&tbs=ic:specific,isc:#{color}"
  page = open(url) { |sock| sock.read }
  CGI.unescape page.match(/imgurl=([^\s&]+)+/)[1]
end

term = 'dog'
colors = %w(red green yellow blue)

puts Benchmark.measure {
  urls = colors.map { |color| image_url color, term }
  p urls
}

puts Benchmark.measure {
  urls = colors.pmap { |color| image_url color, term }
  p urls
}

