# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: [:show, :follow, :unfollow]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to events_path, success: 'ユーザー登録が完了しました'
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def show; end

  def follow
    current_user.follow(@user)
    redirect_to @user
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
