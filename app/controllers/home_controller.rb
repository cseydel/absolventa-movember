class HomeController < ApplicationController

  def index
    @bros = Bro.all()
  end

end
