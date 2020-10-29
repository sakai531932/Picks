class PagesController < ApplicationController
  def index
    if logged_in?
      @profile = Profile.where(user_id: current_user.id)
    end
  end
end
