class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: {controller:"home", action:'index'}
end
