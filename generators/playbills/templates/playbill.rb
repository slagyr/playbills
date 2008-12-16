class Playbill < ActiveRecord::Base
  
  def self.data_root
    return ENV["PLAYBILLS_ROOT"] || "playbills"
  end
  
  def data_dir
    return File.join(Playbill.data_dir, id.to_s)
  end
  
  def establish_data_dir
    establish_dir(data_dir)
  end
  
  def thumbnail_path
    File.join(PLAYBILL_ROOT, id.to_s, "#{name}.png")
  end

  def llp_path
    File.join(PLAYBILL_ROOT, id.to_s, "#{name}.llp")
  end
  
  private #################################################
  
  def establish_dir(dir)
    establish_dir(File.dirname(dir)) if !File.exist?(dir)
    Dir.mkdir(dir) if !File.exist?(dir)
  end
end
