require 'spec_helper'

describe "proverbes/index" do
  before(:each) do
    assign(:proverbes, [
      stub_model(Proverbe,
        :Identifiant => "Identifiant",
        :Corps => "Corps",
        :Description => "Description",
        :user_id => 1
      ),
      stub_model(Proverbe,
        :Identifiant => "Identifiant",
        :Corps => "Corps",
        :Description => "Description",
        :user_id => 1
      )
    ])
  end

  it "renders a list of proverbes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Identifiant".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Corps".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
