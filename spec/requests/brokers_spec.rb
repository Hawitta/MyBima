require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/brokers", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Broker. As you add validations to Broker, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Broker.create! valid_attributes
      get brokers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      broker = Broker.create! valid_attributes
      get broker_url(broker)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_broker_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      broker = Broker.create! valid_attributes
      get edit_broker_url(broker)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Broker" do
        expect {
          post brokers_url, params: { broker: valid_attributes }
        }.to change(Broker, :count).by(1)
      end

      it "redirects to the created broker" do
        post brokers_url, params: { broker: valid_attributes }
        expect(response).to redirect_to(broker_url(Broker.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Broker" do
        expect {
          post brokers_url, params: { broker: invalid_attributes }
        }.to change(Broker, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post brokers_url, params: { broker: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested broker" do
        broker = Broker.create! valid_attributes
        patch broker_url(broker), params: { broker: new_attributes }
        broker.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the broker" do
        broker = Broker.create! valid_attributes
        patch broker_url(broker), params: { broker: new_attributes }
        broker.reload
        expect(response).to redirect_to(broker_url(broker))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        broker = Broker.create! valid_attributes
        patch broker_url(broker), params: { broker: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested broker" do
      broker = Broker.create! valid_attributes
      expect {
        delete broker_url(broker)
      }.to change(Broker, :count).by(-1)
    end

    it "redirects to the brokers list" do
      broker = Broker.create! valid_attributes
      delete broker_url(broker)
      expect(response).to redirect_to(brokers_url)
    end
  end
end
