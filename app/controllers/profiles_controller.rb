class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
    @search_profiles_by_postcode = Profile.search(params[:query])
  end

  def show
    if current_user.present?
      @active_conversation = Conversation.find_by(profile_a_id: current_user.id, profile_b_id: @profile.user_id)
    end

    response = HTTParty.get("http://v0.postcodeapi.com.au/suburbs/#{@profile.postcode}.json")
    @suburbs = []
    response.each { |suburb| @suburbs << suburb['name'] }

  end

  def new
    @profile = Profile.new
    @activity = @profile.activities.build
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :postcode, :profile_photo, :bio, :contact_number, :remove_profile_photo, :query, activities_attributes: [:name, :skill_level])
    end
end
