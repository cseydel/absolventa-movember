class BrosController < ApplicationController

  def show
    @bro = Bro.find(params['id'])
    @bros = Bro.all()
  end

end