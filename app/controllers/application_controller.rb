# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # def after_sign_in_path_for(resource)
  #   tweet_path(resource)
  # end
end
