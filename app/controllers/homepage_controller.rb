class HomepageController < ApplicationController
  def index
    @messages = Message.all
  end
end
