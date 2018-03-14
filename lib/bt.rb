require_relative 'scraper'

scraper = Scraper.new

scraper.setup("https://bt.dk")
scraper.get_headlines(".bt-link")
scraper.generate_csv("bt")
