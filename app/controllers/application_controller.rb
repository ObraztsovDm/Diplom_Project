class ApplicationController < ActionController::Base
  before_action :set_current_page

  private

  def set_current_page
    @current_page = request.path
  end
end
