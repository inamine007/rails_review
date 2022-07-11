class UsersController < ApplicationController
  def show
    login_required
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id

    @favorite_books = Favorite.where(user_id: @user.id).order(created_at: "DESC")

    @reviews = Review.all
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:icon].nil?
      if params[:password].empty? && params[:password_confirmation].empty?
        def update_params
          params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
        end
      else
        def update_params
          params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :password_confirmation)
        end
      end 
    elsif params[:password].empty? && params[:password_confirmation].empty?
      def update_params
        params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :icon)
      end
    else
      def update_params
        params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :icon, :password, :password_confirmation)
      end
    end

    if @user.update(update_params)
      redirect_to "/users/#{@user.id}", notice: "編集しました。"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :icon, :password, :password_confirmation)
  end

  def login_required
    redirect_to login_url unless current_user
  end
end
