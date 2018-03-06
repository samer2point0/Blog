class MessagesController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.js
  end

  def create
  end
end
