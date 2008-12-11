require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlaybillsController do
  describe "route generation" do

    it "should map { :controller => 'playbills', :action => 'index' } to /playbills" do
      route_for(:controller => "playbills", :action => "index").should == "/playbills"
    end
  
    it "should map { :controller => 'playbills', :action => 'new' } to /playbills/new" do
      route_for(:controller => "playbills", :action => "new").should == "/playbills/new"
    end
  
    it "should map { :controller => 'playbills', :action => 'show', :id => 1 } to /playbills/1" do
      route_for(:controller => "playbills", :action => "show", :id => 1).should == "/playbills/1"
    end
  
    it "should map { :controller => 'playbills', :action => 'edit', :id => 1 } to /playbills/1/edit" do
      route_for(:controller => "playbills", :action => "edit", :id => 1).should == "/playbills/1/edit"
    end
  
    it "should map { :controller => 'playbills', :action => 'update', :id => 1} to /playbills/1" do
      route_for(:controller => "playbills", :action => "update", :id => 1).should == "/playbills/1"
    end
  
    it "should map { :controller => 'playbills', :action => 'destroy', :id => 1} to /playbills/1" do
      route_for(:controller => "playbills", :action => "destroy", :id => 1).should == "/playbills/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'playbills', action => 'index' } from GET /playbills" do
      params_from(:get, "/playbills").should == {:controller => "playbills", :action => "index"}
    end
  
    it "should generate params { :controller => 'playbills', action => 'new' } from GET /playbills/new" do
      params_from(:get, "/playbills/new").should == {:controller => "playbills", :action => "new"}
    end
  
    it "should generate params { :controller => 'playbills', action => 'create' } from POST /playbills" do
      params_from(:post, "/playbills").should == {:controller => "playbills", :action => "create"}
    end
  
    it "should generate params { :controller => 'playbills', action => 'show', id => '1' } from GET /playbills/1" do
      params_from(:get, "/playbills/1").should == {:controller => "playbills", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'playbills', action => 'edit', id => '1' } from GET /playbills/1;edit" do
      params_from(:get, "/playbills/1/edit").should == {:controller => "playbills", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'playbills', action => 'update', id => '1' } from PUT /playbills/1" do
      params_from(:put, "/playbills/1").should == {:controller => "playbills", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'playbills', action => 'destroy', id => '1' } from DELETE /playbills/1" do
      params_from(:delete, "/playbills/1").should == {:controller => "playbills", :action => "destroy", :id => "1"}
    end
  end
end
