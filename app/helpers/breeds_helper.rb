module BreedsHelper
  def pageFormat(name)
    cap_name = name.split('-').map{|v| v.capitalize}
    cap_name.join(' ')
  end
end
