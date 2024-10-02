class PagesController < ApplicationController
  before_action :authenticate_user!
  def chat
    @messages = Message.all
    @message = current_user.messages.build
  end
  def test
  end
end
