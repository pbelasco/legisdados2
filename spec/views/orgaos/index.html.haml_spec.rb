require 'spec_helper'

describe "orgaos/index" do
  before(:each) do
    assign(:orgaos, [
      stub_model(Orgao,
        :id => "Id",
        :sigla => "Sigla",
        :descricao => "Descricao"
      ),
      stub_model(Orgao,
        :id => "Id",
        :sigla => "Sigla",
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of orgaos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id".to_s, :count => 2
    assert_select "tr>td", :text => "Sigla".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
