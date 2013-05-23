require 'spec_helper'

describe "parlamentares/new" do
  before(:each) do
    assign(:parlamentar, stub_model(Parlamentar,
      :nome => "MyString",
      :partido => "MyString",
      :legislatura => "MyString"
    ).as_new_record)
  end

  it "renders new parlamentar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parlamentares_path, "post" do
      assert_select "input#parlamentar_nome[name=?]", "parlamentar[nome]"
      assert_select "input#parlamentar_partido[name=?]", "parlamentar[partido]"
      assert_select "input#parlamentar_legislatura[name=?]", "parlamentar[legislatura]"
    end
  end
end
