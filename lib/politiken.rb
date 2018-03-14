require_relative 'scraper'

scraper = Scraper.new
# Virker ikke helt endnu
# Overskrifter med rød skrift adskilt af sort bliver
# set som to forskellige overskrifter
scraper.setup("https://politiken.dk")
scraper.get_headlines(".headline")
scraper.generate_csv("politiken")
