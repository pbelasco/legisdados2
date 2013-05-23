require 'spec_helper'

describe "orgoes/show" do
  before(:each) do
    @orgao = assign(:orgao, stub_model(Orgao,
      :id => "Id",
      :sigla => "Sigla",
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Id/)
    rendered.should match(/Sigla/)
    rendered.should match(/Descricao/)
  end
end
