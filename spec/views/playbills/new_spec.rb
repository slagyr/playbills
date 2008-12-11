require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playbills/new.html.erb" do
  include PlaybillsHelper
  
  before(:each) do
    @playbill = mock_model(Playbill)
    @playbill.stub!(:new_record?).and_return(true)
    assigns[:playbill] = @playbill


    template.stub!(:object_url).and_return(playbill_path(@playbill)) 
    template.stub!(:collection_url).and_return(playbills_path) 
  end

  it "should render new form" do
    render "/playbills/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", playbills_path) do
    end
  end
end


