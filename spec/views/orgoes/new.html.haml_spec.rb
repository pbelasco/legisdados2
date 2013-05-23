require 'spec_helper'

describe "orgoes/new" do
  before(:each) do
    assign(:orgao, stub_model(Orgao,
      :id => "MyString",
      :sigla => "MyString",
      :descricao => "MyString"
    ).as_new_record)
  end

  it "renders new orgao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orgoes_path, "post" do
      assert_select "input#orgao_id[name=?]", "orgao[id]"
      assert_select "input#orgao_sigla[name=?]", "orgao[sigla]"
      assert_select "input#orgao_descricao[name=?]", "orgao[descricao]"
    end
  end
end
