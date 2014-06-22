class Admin::ScreensController < ApplicationController
  before_action :set_admin_screen, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "admin"
  
  # GET /admin/screens
  # GET /admin/screens.json
  def index
    @admin_screens = Screen.all
  end

  # GET /admin/screens/1
  # GET /admin/screens/1.json
  def show
  end

  # GET /admin/screens/new
  def new
    @admin_screen = Screen.new
  end

  # GET /admin/screens/1/edit
  def edit
  end

  # POST /admin/screens
  # POST /admin/screens.json
  def create
    @admin_screen = Screen.new(admin_screen_params)

    respond_to do |format|
      if @admin_screen.save
        format.html { redirect_to @admin_screen, notice: 'Screen was successfully created.' }
        format.json { render :show, status: :created, location: @admin_screen }
      else
        format.html { render :new }
        format.json { render json: @admin_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/screens/1
  # PATCH/PUT /admin/screens/1.json
  def update
    respond_to do |format|
      if @admin_screen.update(admin_screen_params)
        format.html { redirect_to @admin_screen, notice: 'Screen was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_screen }
      else
        format.html { render :edit }
        format.json { render json: @admin_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/screens/1
  # DELETE /admin/screens/1.json
  def destroy
    @admin_screen.destroy
    respond_to do |format|
      format.html { redirect_to admin_screens_url, notice: 'Screen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_screen
      @admin_screen = Screen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_screen_params
      params.require(:admin_screen).permit(:avaiable, :seats_string)
    end
end
