class PlaybillsController < ResourceController::Base
  [:edit, :update, :new, :create, :destroy].each do |unauthorized_method|
    define_method(unauthorized_method) do
      render :status => :unauthorized, :text => "Unathorized"
    end
  end
  
  index do
    wants.xml do
      render :inline => collection.to_xml
    end
    wants.js do
      render :inline => collection.to_json
    end
  end

  show do
    wants.xml do
      render :inline => object.to_xml
    end
    wants.js do
      render :inline => object.to_json
    end
  end

end
