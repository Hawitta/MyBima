class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @beneficiary = Beneficiary.new
    @dependant = Dependant.new
    @broker = Broker.new
    @signature = Signature.new
  end

  # GET /users/1/edit
  def edit
  end

  def checkout
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        if @user.attached_id.attached?
          format.html { redirect_to new_user_path, notice: "User was successfully created." }
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to new_user_path, notice: "User was not successfully created." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :title, :surname, :first_name, :gender, :dob, :nationality,
      :id_number, :attached_id, :email, :phone_number, :sha, :marital_status, :occupation,
      :employer_name, :kra_pin, :attached_kra, :postal_address, :home_address, :signature ])
    end
end
