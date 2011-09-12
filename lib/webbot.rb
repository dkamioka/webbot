require 'open-uri'
MAILRXP = Regexp.new(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/) 

module webbot
  class url_tree
    attr_accessor :node

    def initialize()
      @node = Tree::TreeNode.new("Root",0,"")
    end

    def getmail()
      @node[2].scan(MAILRXP).uniq
    end
    
    def pagina(url)
      a = URI.parse(url).read.to_s
    end
  end
end

