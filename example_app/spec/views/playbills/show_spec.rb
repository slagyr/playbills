require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playbills/show.html.erb" do
  include PlaybillsHelper
  
  before(:each) do
    @playbill = mock_model(Playbill)

    assigns[:playbill] = @playbill

    template.stub!(:edit_object_url).and_return(edit_playbill_path(@playbill)) 
    template.stub!(:collection_url).and_return(playbills_path) 
  end

  it "should render attributes in <p>" do
    render "/playbills/show.html.erb"
  end
end

