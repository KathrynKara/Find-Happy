module TagsHelper
  def location
    [tag.title, tag.address].join("")
  end
end
