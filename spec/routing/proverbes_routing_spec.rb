require "spec_helper"

describe ProverbesController do
  describe "routing" do

    it "routes to #index" do
      get("/proverbes").should route_to("proverbes#index")
    end

    it "routes to #new" do
      get("/proverbes/new").should route_to("proverbes#new")
    end

    it "routes to #show" do
      get("/proverbes/1").should route_to("proverbes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/proverbes/1/edit").should route_to("proverbes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/proverbes").should route_to("proverbes#create")
    end

    it "routes to #update" do
      put("/proverbes/1").should route_to("proverbes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/proverbes/1").should route_to("proverbes#destroy", :id => "1")
    end

  end
end
