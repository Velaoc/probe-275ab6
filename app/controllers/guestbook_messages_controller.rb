# The whole product: one page that shows the wall and takes new entries.
class GuestbookMessagesController < ApplicationController
  def index
    @messages = GuestbookMessage.newest_first
    @message = GuestbookMessage.new
  end

  def create
    @message = GuestbookMessage.new(message_params)
    if @message.save
      redirect_to root_path, notice: "Thanks — your message is on the wall."
    else
      @messages = GuestbookMessage.newest_first
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:guestbook_message).permit(:name, :body)
  end
end
