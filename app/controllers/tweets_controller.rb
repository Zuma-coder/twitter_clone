# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    @user = current_user
  end

  def following
    @user = current_user
  end
end
