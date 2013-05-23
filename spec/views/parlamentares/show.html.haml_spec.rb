require 'spec_helper'

describe "parlamentares/show" do
  before(:each) do
    @parlamentar = assign(:parlamentar, stub_model(Parlamentar,
      :nome => "Nome",
      :partido => "Partido",
      :legislatura => "Legislatura"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Partido/)
    rendered.should match(/Legislatura/)
  end
end
