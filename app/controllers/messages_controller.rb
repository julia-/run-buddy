class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_conversation, only: [:index, :create]

  # GET /messages
  # GET /messages.json
  def index
    @conversation_messages = Message.where(conversation_id: @conversation.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.conversation_id = @conversation.id
    profile = Profile.find(@conversation.profile_b_id)

    # sets the user initiating contact as profile_a
    current_user.id == profile.user_id ? @message.from_profile_a = false : @message.from_profile_a = true

    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
