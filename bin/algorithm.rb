require 'open-uri'
MAILRXP = Regexp.new(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/) 
require 'hpricot'


def getmail(pagina)
  pagina.scan(MAILRXP).uniq
end
    
def pagina(url)
  URI.parse(url).read.to_s
end

def links(pagina)
  h = Hpricot(pagina)
  h.search("a").each { |e| p e }
end

input = ARGV[0]
output = ARGV[1]

@urls = []
@emails = []

File.open(input,'r') do |f| 
  f.each_line do |l|
    @urls << l.strip
  end
  p @urls
  @urls.each do |x|
    a = pagina(x)
    @emails << getmail(a)
  end
  p @emails.flatten
  #p links(a)
end
