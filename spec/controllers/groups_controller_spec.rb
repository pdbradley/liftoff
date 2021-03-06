require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Group. As you add validations to Group, be sure to
  # adjust the attributes here as well.
  let(:user) {create(:user)}
  let(:valid_attributes) {
    attributes_for(:group, user_id: user.id)
  }

  let(:invalid_attributes) {
    attributes_for(:group, name: nil)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    sign_in_as(user)
  end
  describe "GET #index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
      get :index, {}
      expect(assigns(:groups)).to eq([group])
    end
  end

  describe "GET #new" do
    it "assigns a new group as @group" do
      get :new, {}
      expect(assigns(:group)).to be_a_new(Group)
    end
  end

  describe "GET #edit" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :edit, {:id => group.to_param}
      expect(assigns(:group)).to eq(group)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, {:group => valid_attributes}
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, {:group => valid_attributes}
        expect(assigns(:group)).to be_a(Group)
        expect(assigns(:group)).to be_persisted
      end

      it "redirects to the created group" do
        post :create, {:group => valid_attributes}
        expect(response).to redirect_to groups_path
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        post :create, {:group => invalid_attributes}
        expect(assigns(:group)).to be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        post :create, {:group => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:group, name: 'Whee')
      }

      it "updates the requested group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => new_attributes}
        group.reload
        expect(group.name).to eq 'Whee'
      end

      it "assigns the requested group as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}
        expect(assigns(:group)).to eq(group)
      end

      it "redirects to the group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}
        expect(response).to redirect_to(edit_group_path(group))
      end
    end

    context "with invalid params" do
      it "assigns the group as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => invalid_attributes}
        expect(assigns(:group)).to eq(group)
      end

      it "re-renders the 'edit' template" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested group" do
      group = Group.create! valid_attributes
      expect {
        delete :destroy, {:id => group.to_param}
      }.to change(Group, :count).by(-1)
    end

    it "redirects to the groups list" do
      group = Group.create! valid_attributes
      delete :destroy, {:id => group.to_param}
      expect(response).to redirect_to(groups_url)
    end
  end

end
