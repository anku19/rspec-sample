require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign user instance variable' do
      expect(assigns[:users]).to eq(User.all)
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:user]).to be_instance_of(User)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  describe "GET #create" do
    before { post :create, { "User"=> { "name"=>"name" } } }
    specify("should created one my_model") { change{ User.count }.from(0).to(1) }
    
  end

  describe 'GET #edit' do
    before do
    get :edit
    end
  end

  describe 'PATCH #update' do
    before do
       patch :update
    end
    context 'when user not found' do
      let(:params) {{ id: user.id, user: { name: 'test name' } } }

      it 'is expected to redirect_to users path' do
        assert_redirected_to(users_path)
      end
    end
    context 'when user exist in database' do
      let(:user) { FactoryBot.create :user }
      let(:params) { { id: user.id, user: { name: 'test name' } } }

      context 'when data is provided is valid' do
        it 'is expected to update user' do
          expect(user.reload.name).to eq('test name')
        end
      end

      context 'when data is invalid' do
        let(:user) { FactoryBot.create :user }
        let(:params) { { id: user.id, user: { name: '' } } }

        it 'is expected not to update user name' do
          expect(user.reload.name).not_to be_empty
        end
      end
    end
  end
end
