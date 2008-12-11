require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playbills/index.html.erb" do
  include PlaybillsHelper
  
  before(:each) do
    playbill_98 = mock_model(Playbill)
    playbill_99 = mock_model(Playbill)

    assigns[:playbills] = [playbill_98, playbill_99]

    template.stub!(:object_url).and_return(playbill_path(@playbill)) 
    template.stub!(:new_object_url).and_return(new_playbill_path) 
    template.stub!(:edit_object_url).and_return(edit_playbill_path(@playbill)) 
  end

  it "should render list of playbills" do
    render "/playbills/index.html.erb"
  end
end

