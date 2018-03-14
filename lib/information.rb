require_relative 'scraper'

scraper = Scraper.new

scraper.setup("https://information.dk")
scraper.get_headlines(".views-row .node-article .node-title")
scraper.generate_csv("information")
