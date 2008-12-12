require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Playbill do
  before(:each) do
    @playbill = Playbill.new
  end

  it "should be valid" do
    @playbill.should be_valid
  end
end
