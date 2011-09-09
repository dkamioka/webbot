require 'open-uri'
MAILRXP = Regexp.new(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/) 

def getmail(webpage)
  webpage.scan(MAILRXP).uniq
end

def pagina(url)
  a = URI.parse(url).read.to_s
end
