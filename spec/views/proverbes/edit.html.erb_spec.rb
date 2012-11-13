require 'spec_helper'

describe "proverbes/edit" do
  before(:each) do
    @proverbe = assign(:proverbe, stub_model(Proverbe,
      :Identifiant => "MyString",
      :Corps => "MyString",
      :Description => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit proverbe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => proverbes_path(@proverbe), :method => "post" do
      assert_select "input#proverbe_Identifiant", :name => "proverbe[Identifiant]"
      assert_select "input#proverbe_Corps", :name => "proverbe[Corps]"
      assert_select "input#proverbe_Description", :name => "proverbe[Description]"
      assert_select "input#proverbe_user_id", :name => "proverbe[user_id]"
    end
  end
end
