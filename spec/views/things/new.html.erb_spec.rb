require 'spec_helper'

describe "things/new" do
  before(:each) do
    assign(:thing, stub_model(Thing,
      :name => "MyString",
      :weight => "MyString",
      :size => "MyString"
    ).as_new_record)
  end

  it "renders new thing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", things_path, "post" do
      assert_select "input#thing_name[name=?]", "thing[name]"
      assert_select "input#thing_weight[name=?]", "thing[weight]"
      assert_select "input#thing_size[name=?]", "thing[size]"
    end
  end
end
