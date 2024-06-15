# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    @user = current_user
    @tweets = Tweet.all.order(created_at: :desc)
                   .page(params[:page]).per(20)
  end

  def following
    @user = current_user
    @tweets = Tweet.followings(current_user)
                   .page(params[:page]).per(20)
    render :index
  end
end
