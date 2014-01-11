module TagsHelper
  def location
    [tag.title, tag.address].join("")
  end

  def gmapmarkers tags
    latlongs = tags.map { |tag| "#{tag.latitude}, #{tag.longitude}"}
    latlongs.join("|") # CGI.escape 
  end
end
