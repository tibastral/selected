module Selected
  def selected?(controller_name, action_name="", id="")
    if controller_matches(controller_name) && action_matches(action_name) && params[:id] == id
      SELECTED_CLASS_NAME || "active"
    end
    unless action_name.present?
      action_name = params[:action]
    end
    unless id.present?
      id = params[:id]
    end

    if controller_matches(controller_name) && action_matches(action_name) && params[:id] == id
      SELECTED_CLASS_NAME || "active"
    end
  end

  private

  def controller_matches(controller_name)
    if controller_name.is_a?(Regexp)
      controller_name =~ params[:controller]
    else
      controller_name.to_s == params[:controller]
    end
  end

  def action_matches(action_name)
    (action_name.respond_to?(:each) && action_name.map(&:to_s).include?(params[:action])) || params[:action] == action_name.to_s
  end
end
