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
    wants.thumbnail do
      send_file(@playbill.thumbnail_path, :type => Mime::Type.lookup_by_extension("thumbnail").to_s, :disposition=>'inline')
    end
    wants.llp do
      send_file(@playbill.llp_path, :type => Mime::Type.lookup_by_extension("llp").to_s)
    end
  end

end
