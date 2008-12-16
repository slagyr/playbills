class Playbill < ActiveRecord::Base
  PLAYBILL_ROOT = File.join(Rails.root, "public", "playbill_data")


  def thumbnail_path
    File.join(PLAYBILL_ROOT, id.to_s, "#{name}.png")
  end

  def llp_path
    File.join(PLAYBILL_ROOT, id.to_s, "#{name}.llp")
  end
end
