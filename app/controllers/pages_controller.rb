class PagesController < ApplicationController
  def index
    @images = Image.all
  end
end
