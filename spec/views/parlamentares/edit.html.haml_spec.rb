require 'spec_helper'

describe "parlamentares/edit" do
  before(:each) do
    @parlamentar = assign(:parlamentar, stub_model(Parlamentar,
      :nome => "MyString",
      :partido => "MyString",
      :legislatura => "MyString"
    ))
  end

  it "renders the edit parlamentar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parlamentar_path(@parlamentar), "post" do
      assert_select "input#parlamentar_nome[name=?]", "parlamentar[nome]"
      assert_select "input#parlamentar_partido[name=?]", "parlamentar[partido]"
      assert_select "input#parlamentar_legislatura[name=?]", "parlamentar[legislatura]"
    end
  end
end
