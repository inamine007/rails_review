class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "ユーザー「#{@user.last_name}#{@user.first_name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :icon, :password, :password_confirmation)
  end
end
