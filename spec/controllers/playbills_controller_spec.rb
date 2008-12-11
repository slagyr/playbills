require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlaybillsController do
  describe "handling GET /playbills" do

    before(:each) do
      @playbill = mock_model(Playbill)
      Playbill.stub!(:find).and_return([@playbill])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all playbills" do
      Playbill.should_receive(:find).with(:all).and_return([@playbill])
      do_get
    end
  
    it "should assign the found playbills for the view" do
      do_get
      assigns[:playbills].should == [@playbill]
    end
  end

  describe "handling GET /playbills/1" do

    before(:each) do
      @playbill = mock_model(Playbill)
      Playbill.stub!(:find).and_return(@playbill)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the playbill requested" do
      Playbill.should_receive(:find).with("1").and_return(@playbill)
      do_get
    end
  
    it "should assign the found playbill for the view" do
      do_get
      assigns[:playbill].should equal(@playbill)
    end
  end

  describe "handling GET /playbills/new" do

    before(:each) do
      @playbill = mock_model(Playbill)
      Playbill.stub!(:new).and_return(@playbill)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new playbill" do
      Playbill.should_receive(:new).and_return(@playbill)
      do_get
    end
  
    it "should not save the new playbill" do
      @playbill.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new playbill for the view" do
      do_get
      assigns[:playbill].should equal(@playbill)
    end
  end

  describe "handling GET /playbills/1/edit" do

    before(:each) do
      @playbill = mock_model(Playbill)
      Playbill.stub!(:find).and_return(@playbill)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the playbill requested" do
      Playbill.should_receive(:find).and_return(@playbill)
      do_get
    end
  
    it "should assign the found Playbills for the view" do
      do_get
      assigns[:playbill].should equal(@playbill)
    end
  end

  describe "handling POST /playbills" do

    before(:each) do
      @playbill = mock_model(Playbill, :to_param => "1")
      Playbill.stub!(:new).and_return(@playbill)
    end
    
    describe "with successful save" do
  
      def do_post
        @playbill.should_receive(:save).and_return(true)
        post :create, :playbill => {}
      end
  
      it "should create a new playbill" do
        Playbill.should_receive(:new).with({}).and_return(@playbill)
        do_post
      end

      it "should redirect to the new playbill" do
        do_post
        response.should redirect_to(playbill_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @playbill.should_receive(:save).and_return(false)
        post :create, :playbill => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /playbills/1" do

    before(:each) do
      @playbill = mock_model(Playbill, :to_param => "1")
      Playbill.stub!(:find).and_return(@playbill)
    end
    
    describe "with successful update" do

      def do_put
        @playbill.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the playbill requested" do
        Playbill.should_receive(:find).with("1").and_return(@playbill)
        do_put
      end

      it "should update the found playbill" do
        do_put
        assigns(:playbill).should equal(@playbill)
      end

      it "should assign the found playbill for the view" do
        do_put
        assigns(:playbill).should equal(@playbill)
      end

      it "should redirect to the playbill" do
        do_put
        response.should redirect_to(playbill_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @playbill.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /playbills/1" do

    before(:each) do
      @playbill = mock_model(Playbill, :destroy => true)
      Playbill.stub!(:find).and_return(@playbill)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the playbill requested" do
      Playbill.should_receive(:find).with("1").and_return(@playbill)
      do_delete
    end
  
    it "should call destroy on the found playbill" do
      @playbill.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the playbills list" do
      do_delete
      response.should redirect_to(playbills_url)
    end
  end
end
