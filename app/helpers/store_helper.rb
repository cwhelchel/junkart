module StoreHelper
  def render_notice
    if (flash[:notice])
      return content_tag(:p, flash[:notice], :id => 'notice')
    else
      return content_tag(:p, '', :id => 'notice', :style => "display:none;")
    end
  end
end
