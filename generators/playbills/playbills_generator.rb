class PlaybillsGenerator < Rails::Generator::Base
  
  def initialize(a, b)
    super(a, b)
    system "script/generate scaffold_resource Playbill name:string title:string description:text author:string version:string size:string"
  end
  
  def manifest
    record do |m|
      m.template('models/playbill.rb', File.join('app', 'models', "playbill.rb"))
      m.template('models/playbill_spec.rb', File.join('spec', 'models', "playbill.rb"))
      m.template('controllers/playbills_controller.rb', File.join('app', 'controllers', "playbills_controller.rb"))
      m.template('spec/controllers/playbills_controller_spec.rb', File.join('spec', 'controllers', "playbills_controller_spec.rb"))
    end
  end

  protected ###############################################
  
  def banner
    "Usage: #{$0} playbills"
  end
  
end