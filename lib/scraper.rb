require 'HTTParty'
require 'Nokogiri'
require 'csv'

class Scraper
attr_accessor :parse_page

  def setup(url)
    doc = HTTParty.get(url)
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def get_headlines(selector)
    @headlines = parse_page.css(selector).children.map { |name| [name.text.strip] }.compact
  end

  def generate_csv(name)
    date = Time.now.strftime("%d_%m_%Y_%H_%M")
    file_name = "#{name}_#{date}.csv"
    out_file = File.new(file_name, "w")
    unique_headlines = @headlines.uniq

    CSV.open(out_file, "w+") do |csv|
      csv.puts(["headline"])
      (0...unique_headlines.size).each do |index|
        csv.puts(unique_headlines[index])
      end
    end
  end
end
