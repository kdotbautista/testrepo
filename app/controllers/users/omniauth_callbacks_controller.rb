class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth("Twitter")
  end

  def github
    auth("Github")
  end

  def facebook
    auth("Facebook")
  end

  def auth (kind)

    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => kind) if is_navigational_format?
    else
      session["devise.user_data"] = request.env["omniauth.auth"].except('extra')
      session["devise.user_data.name"] = request.env["omniauth.auth.extra.raw_info.name"]
      redirect_to new_user_registration_url
    end
  end

  def after_sign_in_path_for(resource_name)
    :cfps
  end

  def after_omniauth_failure_path_for(resource_name)
    :cfp
  end
end
