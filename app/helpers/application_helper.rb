module ApplicationHelper
  def avatar_for
    if current_user.image.attachment.nil?
      image_tag('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQQLE9ACKnCKA0lk9QtAAAYslgAu6xu-RVaeA&usqp=CAU', alt: current_user.name, class: 'pic')
    else
      image_tag(current_user.image, class: 'pic')
    end
  end

  def navbar1
    if user_signed_in?
      avatar_for
    end
  end

    def navbar2
      if user_signed_in?
        link_to current_user.name, edit_user_registration_path, class: 'button is-info'
      end
    end

  def navbar3
    if user_signed_in?
      link_to "Logout", destroy_user_session_path, method: :delete, class: 'button is-info'
    end
  end

  def navbar4
    if !user_signed_in?
      link_to "Sign up", new_user_registration_path, class: 'button is-info'
    end
  end

  def navbar5
    if !user_signed_in?
      link_to "Login", new_user_session_path, class: 'button is-info'
    end
  end
end
