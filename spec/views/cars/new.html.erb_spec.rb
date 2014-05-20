require 'spec_helper'

describe "cars/new" do
  before(:each) do
    assign(:car, stub_model(Car,
      :name => "MyString",
      :company => "MyString",
      :wheels => 1,
      :color => "MyString",
      :doors => 1
    ).as_new_record)
  end

  it "renders new car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cars_path, "post" do
      assert_select "input#car_name[name=?]", "car[name]"
      assert_select "input#car_company[name=?]", "car[company]"
      assert_select "input#car_wheels[name=?]", "car[wheels]"
      assert_select "input#car_color[name=?]", "car[color]"
      assert_select "input#car_doors[name=?]", "car[doors]"
    end
  end
end
