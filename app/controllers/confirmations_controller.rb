class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # In case you want to sign in the user
    print "resource_name la gi"
    puts resource_name
    print "resource la gi"
    puts resource
    root_path
    # your_new_after_confirmation_path
  end
end
