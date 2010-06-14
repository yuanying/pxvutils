require File.dirname(__FILE__) + '/spec_helper.rb'

describe Pxv::User do
  before do
    @user = Pxv::User.new(nil, '888888')
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
