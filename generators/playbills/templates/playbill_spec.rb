require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Playbill do
  before(:each) do
    @playbill = Playbill.new
  end

  it "should be valid" do
    @playbill.should be_valid
  end
  
  it "should include llp link in json" do
    @playbill.id = 123
    json = @playbill.to_json
    json.should include("llp_url")
    json.should include(@playbill.llp_url)
  end

  it "should include thumbnail link in json" do
    @playbill.id = 123
    json = @playbill.to_json
    json.should include("thumbnail_url")
    json.should include(@playbill.thumbnail_url)
  end
end
