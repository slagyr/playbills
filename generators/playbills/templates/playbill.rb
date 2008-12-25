class Playbill < ActiveRecord::Base
  
  def self.data_root
    return ENV["PLAYBILLS_ROOT"] || "playbills"
  end
  
  def data_dir
    return File.join(Playbill.data_root, id.to_s)
  end
  
  def establish_data_dir
    establish_dir(data_dir)
  end
  
  def thumbnail_path
    File.join(data_dir, "thumbnail.png")
  end
  
  def thumbnail_url
    return "/playbills/#{id}.thumbnail"
  end

  def llp_path
    File.join(data_dir, "#{name}.llp")
  end
  
  def llp_url
    return "/playbills/#{id}.llp"
  end
  
  def to_json(options={})
    options[:methods] = [:llp_url, :thumbnail_url]
    super(options)
  end
  
  private #################################################
  
  def establish_dir(dir)
    establish_dir(File.dirname(dir)) if !File.exist?(dir)
    Dir.mkdir(dir) if !File.exist?(dir)
  end
end
