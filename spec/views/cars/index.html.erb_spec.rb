require 'spec_helper'

describe "cars/index" do
  before(:each) do
    assign(:cars, [
      stub_model(Car,
        :name => "Name",
        :company => "Company",
        :wheels => 1,
        :color => "Color",
        :doors => 2
      ),
      stub_model(Car,
        :name => "Name",
        :company => "Company",
        :wheels => 1,
        :color => "Color",
        :doors => 2
      )
    ])
  end

  it "renders a list of cars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
