require 'spec_helper'

describe "cars/show" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :name => "Name",
      :company => "Company",
      :wheels => 1,
      :color => "Color",
      :doors => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Company/)
    rendered.should match(/1/)
    rendered.should match(/Color/)
    rendered.should match(/2/)
  end
end
