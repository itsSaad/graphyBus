require 'spec_helper'

describe "things/index" do
  before(:each) do
    assign(:things, [
      stub_model(Thing,
        :name => "Name",
        :weight => "Weight",
        :size => "Size"
      ),
      stub_model(Thing,
        :name => "Name",
        :weight => "Weight",
        :size => "Size"
      )
    ])
  end

  it "renders a list of things" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Weight".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
  end
end
