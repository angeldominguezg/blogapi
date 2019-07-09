require "rails_helper"

RSpec.describe "Posts", type: :request do

  describe "Get /post" do
    before { get '/post' }
    
    it "Should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(response).to have_http_status(200)
    end

    describe "With data in the DB" do
      before { get '/post' }
      let(:posts) { create_list(:post, 10, published: true)}

      it "Should return all the published post" do
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(post.size)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "Get /post/{id}" do
    let(:posts) { create_list(:post)}

    it "Should return a post" do
      get "/post/#{post.id}" 
      payload = JSON.parse(response.body)
      expect(payload.size).not_to be_empty
      expect(payload["id"]).to eq(post.id)
      expect(response).to have_http_status(200)
    end
  end

end
