require 'nokogiri'
require 'open-uri'
require 'chronic'

post_titles_and_dates = (1..3).flat_map do |i|
  page = Nokogiri::HTML(open("http://somethingdoneright.net/page/#{i}"))
  blog_posts = page.css(".post")
  # need to go from post title and post date to YEAR-MONTH-DAY-title.MARKUP
  blog_posts.map do |post|
    title = post.at_css("h2")
    dateel = post.at_css(".datetime")
    if dateel and title
      datestring = dateel.text.gsub(/(\d notes)|(1 note)/, "")
      date = Chronic.parse(datestring)
      slug = title.text.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      "#{date.strftime("%Y-%m-%d")}-#{slug}.md"
    end
  end
end

# post_titles_and_dates.each {|p| puts p }

Dir.entries("../_posts").reject {|e| e == "." }.each do |entry| 
  post_titles_and_dates.compact.each do |name|
    if name.include?(entry.gsub('_', '-'))
      # puts "Matched #{entry} with #{name}"
      `mv ../_posts/#{entry} ../_posts/#{name}`
    end
  end
end
