require 'spec_helper'

describe "parlamentares/index" do
  before(:each) do
    assign(:parlamentares, [
      stub_model(Parlamentar,
        :nome => "Nome",
        :partido => "Partido",
        :legislatura => "Legislatura"
      ),
      stub_model(Parlamentar,
        :nome => "Nome",
        :partido => "Partido",
        :legislatura => "Legislatura"
      )
    ])
  end

  it "renders a list of parlamentares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Partido".to_s, :count => 2
    assert_select "tr>td", :text => "Legislatura".to_s, :count => 2
  end
end
