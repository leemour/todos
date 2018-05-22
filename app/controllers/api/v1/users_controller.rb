class API::V1::UsersController < API::V1::BaseController  
  before_action :set_user, only: [:show]

  respond_to :json

  def index
    @users = User.includes(:todos)
    render json: UserSerializer.new(@users)
  end

  def show
    render json: UserSerializer.new(@user, include: [:todos])
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

end
