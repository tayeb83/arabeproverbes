require 'spec_helper'

describe "proverbes/show" do
  before(:each) do
    @proverbe = assign(:proverbe, stub_model(Proverbe,
      :Identifiant => "Identifiant",
      :Corps => "Corps",
      :Description => "Description",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Identifiant/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Corps/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
