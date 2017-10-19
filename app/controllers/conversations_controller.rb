class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:show]
  before_action :set_profile, only: [:index, :create]

  def index
    @conversations = Conversation.where(profile_b: @profile.user_id)
  end

  def show
    @messages = Message.where(conversation_id: @conversation)
  end

  def create
    @conversation = Conversation.new
    @conversation.profile_a_id = current_user.id
    @conversation.profile_b_id = @profile.user_id

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to new_conversation_message_path(@conversation), notice: 'Conversation was successfully started.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render profile_path(@profile) }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:profile_a_id, :profile_b_id)
    end
end
