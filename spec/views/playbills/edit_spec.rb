require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playbills/edit.html.erb" do
  include PlaybillsHelper
  
  before do
    @playbill = mock_model(Playbill)
    assigns[:playbill] = @playbill

    template.should_receive(:object_url).twice.and_return(playbill_path(@playbill)) 
    template.should_receive(:collection_url).and_return(playbills_path) 
  end

  it "should render edit form" do
    render "/playbills/edit.html.erb"
    
    response.should have_tag("form[action=#{playbill_path(@playbill)}][method=post]") do
    end
  end
end


