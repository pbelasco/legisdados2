require 'spec_helper'

describe "orgaos/edit" do
  before(:each) do
    @orgao = assign(:orgao, stub_model(Orgao,
      :id => "MyString",
      :sigla => "MyString",
      :descricao => "MyString"
    ))
  end

  it "renders the edit orgao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orgao_path(@orgao), "post" do
      assert_select "input#orgao_id[name=?]", "orgao[id]"
      assert_select "input#orgao_sigla[name=?]", "orgao[sigla]"
      assert_select "input#orgao_descricao[name=?]", "orgao[descricao]"
    end
  end
end
