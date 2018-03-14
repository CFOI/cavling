require_relative 'scraper'

scraper = Scraper.new

scraper.setup("https://b.dk")
scraper.get_headlines(".header")
scraper.generate_csv("berlingske")
