require 'rails_helper'

describe HomepageController, :type => :controller do
  describe '#index' do
    it 'returns 200' do
      get :index
      expect(response.status).to be 200
      end
    end

  describe '#about' do
    it 'returns 200' do
      get :about
      expect(response.status).to be 200
      end
    end

  describe '#cookies' do
    it 'returns 200' do
      get :cookies
      expect(response.status).to be 200
      end
    end
end

