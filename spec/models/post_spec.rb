require 'rails_helper'

describe Post, type: :model do
  context 'header' do
    it 'should not allow empty header', :unit do
      expect do
        expect do
          FactoryGirl.create :post, header: ''
        end.to raise_error(Exception)
      end.to change(Post, :count).by 0
    end

    it 'should not allow nil header', :unit do
      expect do
        expect do
          FactoryGirl.create :post, header: nil
        end.to raise_error(Exception)
      end.to change(Post, :count).by 0
    end
  end

  context 'content' do
    it 'should not allow empty content', :unit do
      expect do
        expect do
          FactoryGirl.create :post, content: ''
        end.to raise_error(Exception)
      end.to change(Post, :count).by 0
    end

    it 'should not allow nil content', :unit do
      expect do
        expect do
          FactoryGirl.create :post, content: nil
        end.to raise_error(Exception)
      end.to change(Post, :count).by 0
    end
  end
end
