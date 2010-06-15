require File.dirname(__FILE__) + '/spec_helper.rb'

describe Pxv::User do
  before do
    @document = Nokogiri::HTML(open(File.join($fixture_dir, 'html', 'member_illust.01.html')))
    page      = mock('page', :root => @document)
    agent     = mock('agent', :get => page)
    pixiv     = mock('pixiv', :agent => agent)
    @user     = Pxv::User.new(pixiv, '888888')
  end
  
  describe '#initial_page_url' do
    
    it 'return initial illust page url.' do
      @user.initial_page_url.should == 'http://www.pixiv.net/member_illust.php?id=888888'
    end
    
  end
  
  describe '#analyze_username' do
    
    it 'analyze initial page document and return username.' do
      @user.analyze_username(@document).should == 'branch'
    end
    
  end
  
  describe '#analyze_page_urls' do
    
    it 'analyze initial page document and return illust pages url list.' do
      @user.analyze_page_urls(@document).should == [
        'http://www.pixiv.net/member_illust.php?id=25804',
        'http://www.pixiv.net/member_illust.php?id=25804&p=2',
        'http://www.pixiv.net/member_illust.php?id=25804&p=3',
        'http://www.pixiv.net/member_illust.php?id=25804&p=4',
        'http://www.pixiv.net/member_illust.php?id=25804&p=5',
        'http://www.pixiv.net/member_illust.php?id=25804&p=6'
      ]
    end
    
  end
  
  describe '#analyze_images' do
    
    it 'analyze illust page document and return images list, it contains Pxv::Image and Pxv::Manga instance.'
    
  end
  
  describe '#analyze_illust_page' do
    before do
      @illsut_page_document = Nokogiri::HTML(open(File.join($fixture_dir, 'html', 'member_illust.illust.html')))
    end
    
    it 'should return Pxv::Illust instance.' do
      @user.analyze_illust_page(@illsut_page_document).should be_kind_of(Pxv::Illust)
    end
    
  end
  
  describe '#analyze_manga_page' do
    before do
      @manga_page_document = Nokogiri::HTML(open(File.join($fixture_dir, 'html', 'member_illust.manga.html')))
    end
    
    it 'should return Pxv::Manga instance.' do
      @user.analyze_manga_page(@manga_page_document).should be_kind_of(Pxv::Manga)
    end
    
  end
  
end
