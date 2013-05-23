require "spec_helper"

describe ParlamentaresController do
  describe "routing" do

    it "routes to #index" do
      get("/parlamentares").should route_to("parlamentares#index")
    end

    it "routes to #new" do
      get("/parlamentares/new").should route_to("parlamentares#new")
    end

    it "routes to #show" do
      get("/parlamentares/1").should route_to("parlamentares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/parlamentares/1/edit").should route_to("parlamentares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/parlamentares").should route_to("parlamentares#create")
    end

    it "routes to #update" do
      put("/parlamentares/1").should route_to("parlamentares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/parlamentares/1").should route_to("parlamentares#destroy", :id => "1")
    end

  end
end
