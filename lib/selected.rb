module Selected
  def selected?(controller_name, action_name="", id="")
    if controller_matches(controller_name) && action_matches(action_name) && params[:id] == id
      "selected"
    end
    unless action_name.present?
      action_name = params[:action]
    end
    unless id.present?
      id = params[:id]
    end

    if controller_matches(controller_name) && action_matches(action_name) && params[:id] == id
      "selected"
    end
  end

  private

  def controller_matches(controller_name)
    if controller_name.respond_to?(:=~)
      controller_name =~ params[:controller]
    else
      controller_name.to_s == params[:controller]
    end
  end

  def action_matches(action_name)
    (action_name.respond_to?(:each) && action_name.map(&:to_s).include?(params[:action])) || params[:action] == action_name.to_s
  end
end
