require 'rails_helper'

describe PostController, type: :controller do

  let(:valid_attributes) do
    {
      header: 'Test Header',
      content: 'testing testing testing'
    }
  end

  context 'create' do
    it 'should return a :created status when provided valid_attributes', :unit do
      expect do
        post :create, post: valid_attributes

        expect(response).to have_http_status(:created)

        body = JSON.parse(response.body, symbolize_names: true)
        expect(body[:header]).to eq(valid_attributes[:header])
        expect(body[:content]).to eq(valid_attributes[:content])
        expect(body[:id]).to_not be_nil
      end.to change{Post.count}.by 1
    end
  end

  xcontext 'read' do
  end

  xcontext 'update' do
  end

  xcontext 'destroy' do
  end
end
