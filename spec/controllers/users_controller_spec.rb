require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user = User.create!(email: "peter@example.com", password: "1234567890")
    @user2 = User.create!(email: "test@example.com", password: "1234567890")
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
      end

      it 'cant access other users show page' do
        get :show, params: { id: @user2.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
