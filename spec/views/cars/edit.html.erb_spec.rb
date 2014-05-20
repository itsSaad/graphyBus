require 'spec_helper'

describe "cars/edit" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :name => "MyString",
      :company => "MyString",
      :wheels => 1,
      :color => "MyString",
      :doors => 1
    ))
  end

  it "renders the edit car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", car_path(@car), "post" do
      assert_select "input#car_name[name=?]", "car[name]"
      assert_select "input#car_company[name=?]", "car[company]"
      assert_select "input#car_wheels[name=?]", "car[wheels]"
      assert_select "input#car_color[name=?]", "car[color]"
      assert_select "input#car_doors[name=?]", "car[doors]"
    end
  end
end
