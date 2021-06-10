class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def handle_auth_with app
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: app
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{app}_data"] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def google_oauth2
    handle_auth_with 'Google'
  end

  def facebook
    handle_auth_with "Facebook"
  end
  
end