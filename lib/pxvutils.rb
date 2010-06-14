require 'logger'
require 'fileutils'
require 'mechanize'

class Pxv
  attr_reader :wait_time
  attr_reader :logger
  attr_reader :agent
  
  def initialize options={}
    @agent                  = WWW::Mechanize.new
    @wait_time              = options[:wait] ? options[:wait] : 3
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
  
  def download_image image, path
    
  end
  
  def download_manga manga, dir_path
    
  end
  
  class User
    attr_accessor :id
    attr_accessor :username
    
    def recent_images
      []
    end
    
    def images
      []
    end
  end

  class Image
    attr_accessor :user
    attr_accessor :thumbnail_url
    attr_accessor :url
  end
  
  class Manga
    attr_accessor :user
    attr_accessor :images
  end
  
end
