module ApplicationHelper

  def full_title(title)
    title + ' | Samer\'s Web'
  end

  def active_class(expected, given)
    if(expected==given)
      return 'active'
    end
    ''
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

end
