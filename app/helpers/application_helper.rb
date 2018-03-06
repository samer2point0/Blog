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

end
