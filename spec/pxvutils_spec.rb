require File.dirname(__FILE__) + '/spec_helper.rb'

describe Pxv::User do
  before do
    page  = mock('page', :root => Nokogiri::HTML(open(File.join($fixture_dir, 'html', 'member_illust.01.html'))))
    agent = mock('agent', :get => page)
    pixiv = mock('pixiv', :agent => agent)
    @user = Pxv::User.new(pixiv, '888888')
  end
  
  describe '#analyze_username' do
    
    it 'analyze initial page document and return username.'
    
  end
  
  describe '#analyze_page_urls' do
    
    it 'analyze initial page document and return illust pages url list.'
    
  end
  
  describe '#analyze_images' do
    
    it 'analyze illust page document and return images list, it contains Pxv::Image and Pxv::Manga instance.'
    
  end
end
