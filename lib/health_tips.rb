require 'nokogiri'
require 'httparty'
require 'byebug'

class Scrapper
  def health_tips
    tips = []
    url = "https://www.webmd.com/a-to-z-guides/living-with-sickle-cell"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    title1 = parsed_page.css('h2#1-2')
    title2 = parsed_page.css('h2#2-3')
    title3 = parsed_page.css('h2#2-4')
    title4 = parsed_page.css('h2#3-5')
    title5 = parsed_page.css('h2#3-7')
    tip_lists = parsed_page.xpath("//section//ul//li").each do |tip_list|
      tips << tip_list.text
    end
  
    deal = []
    i = 0
    while i < 4
      deal << tips[i]
      i += 1
    end
    puts deal[2]
  end
  
  health_tips
end
