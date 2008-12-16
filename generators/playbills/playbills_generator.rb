class PlaybillsGenerator < Rails::Generator::Base
  
  def initialize(a, b)
    super(a, b)
    system "script/generate scaffold_resource Playbill name:string title:string description:text author:string version:string size:string"
    system "rm #{File.join('app', 'models', "playbill.rb")}"
    system "rm #{File.join('spec', 'models', "playbill.rb")}"
    system "rm #{File.join('app', 'controllers', "playbills_controller.rb")}"
    system "rm #{File.join('spec', 'controllers', "playbills_controller_spec.rb")}"
  end
  
  def manifest
    record do |m|
      m.template('playbill.rb', File.join('app', 'models', "playbill.rb"))
      m.template('playbill_spec.rb', File.join('spec', 'models', "playbill.rb"))
      m.template('playbills_controller.rb', File.join('app', 'controllers', "playbills_controller.rb"))
      m.template('playbills_controller_spec.rb', File.join('spec', 'controllers', "playbills_controller_spec.rb"))
    end
  end

  protected ###############################################
  
  def banner
    "Usage: #{$0} playbills"
  end
  
end