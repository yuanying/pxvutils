require 'rubygems'
require 'logger'
require 'fileutils'
require 'mechanize'

class Pxv
  attr_reader :logger
  attr_reader :agent
  
  def initialize options={}
    @agent                  = WWW::Mechanize.new
    @logger                 = options[:logger] ? options[:logger] : Logger.new(STDOUT)
    @agent.log              = @logger
    @agent.user_agent_alias = 'Windows IE 7'
    
    login options[:pixiv_id], options[:password] if options[:pixiv_id]
  end
  
  def login pixiv_id, password
    agent.post( 
      'http://www.pixiv.net/index.php', 
      'mode' => 'login', 
      'pixiv_id' => pixiv_id, 
      'pass' => password, 
      'skip' => '1',
      'submit.x' => '0',
      'submit.y' => '0'
      )
  end
  
  def user id
    
  end
  
  class User
    attr_accessor :pixiv
    attr_accessor :id
    attr_accessor :username
    attr_accessor :recent_images
    attr_accessor :images
    
    def initialize pixiv, id
      @pixiv  = pixiv
      @id     = id
      
      page              = pixiv.agent.get( initial_page_url )
      @username         = analyze_username( page.root )
      @illust_page_urls = analyze_page_urls( page.root )
      @recent_images    = analyze_images( page.root )
    end
    
    def recent_images
      unless @recent_images
        @recent_images = analyze_images( page.root )
      end
      @recent_images
    end
    
    def images
      []
    end
    
    def initial_page_url
      "http://www.pixiv.net/member_illust.php?id=#{@id}"
    end
    
    def analyze_username(document)
      
    end
    
    def analyze_page_urls(document)
      
    end
    
    def analyze_images(document)
      
    end
    
  end

  class Illust
    attr_accessor :pixiv
    attr_accessor :user
    attr_accessor :thumbnail_url
    attr_accessor :url
  end
  
  class Manga
    attr_accessor :pixiv
    attr_accessor :user
    attr_accessor :thumbnail_url
    attr_accessor :images
  end
  
end
