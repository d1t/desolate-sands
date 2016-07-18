class BetaUsersController < ApplicationController
  before_action :authorize, only: [:index, :show, :update, :destroy]
  before_action :set_beta_user, only: [:edit, :update, :destroy]
  
  # GET /beta_users
  # GET /beta_users.json
  def index
    @beta_users = BetaUser.all
  end

  # GET /beta_users/1
  # GET /beta_users/1.json
  def show
  end

  # GET /beta_users/new
  def new
    @beta_user = BetaUser.new
  end

  # GET /beta_users/1/edit
  def edit
  end

  # POST /beta_users
  # POST /beta_users.json
  def create
    @beta_user = BetaUser.new(beta_user_params)

    respond_to do |format|
      if @beta_user.save
        format.html { redirect_to root_path, notice: "We'll be in touch shortly." }
        format.json { render :show, status: :created, location: @beta_user }
        UserNotifier.signup(@beta_user, @admin).deliver_now
        UserNotifier.thanks(@beta_user).deliver_now
      else
        format.html { render :new }
        format.json { render json: @beta_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beta_users/1
  # PATCH/PUT /beta_users/1.json
  def update
    respond_to do |format|
      if @beta_user.update(beta_user_params)
        format.html { redirect_to @beta_user, notice: 'Beta user was successfully updated.' }
        format.json { render :show, status: :ok, location: @beta_user }
      else
        format.html { render :edit }
        format.json { render json: @beta_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beta_users/1
  # DELETE /beta_users/1.json
  def destroy
    @beta_user.destroy
    respond_to do |format|
      format.html { redirect_to beta_users_url, notice: 'Beta user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beta_user
      @beta_user = BetaUser.find(params[:id])
    end

    def authorize
      unless current_admin
        flash[:alert] = 'Unauthorized'
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beta_user_params
      params.require(:beta_user).permit(:first_name, :last_name, :email, :role)
    end
end
