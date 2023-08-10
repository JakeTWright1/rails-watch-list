require 'open-uri'
require 'json'
require 'nokogiri'
poster_urls = []
titles = []
overviews = []
# movies = {
#   title:
#   poster_url:
#   overviews:
# }
url = 'https://www.imdb.com/list/ls566160570/'
html = URI.open(url).read
doc = Nokogiri::HTML.parse(html)
url_posters = "https://letterboxd.com/bfi/list/sight-and-sounds-greatest-films-of-all-time/"
html_posters = URI.open(url_posters).read
doc_posters = Nokogiri::HTML.parse(html_posters)



doc.search('.lister-item-image').each do |p|
 p poster_urls << p.css("img").attribute("src").value
end
doc.search('.lister-item-content').each do |p|
  overviews << p.css("p")[1].inner_text
end
doc.search('.lister-item-content').css('.lister-item-header').each do |p|
  titles << p.css('a').inner_text
end


movies_array = [titles, overviews, poster_urls].transpose.each { |x, y, z| p [x, y, z] }

puts "clearing the database"

Movie.destroy_all

puts "Adding movies!"
movies_array.each do |movie|
  new_movie = Movie.new(
    title: movie[0],
    overview: movie[1],
    poster_url: movie[2]
  )
  new_movie.save
end

puts "Finished"
