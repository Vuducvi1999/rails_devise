class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end
  def content_sample
  end
end
