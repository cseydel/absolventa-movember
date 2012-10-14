class BrosController < ApplicationController

  def show
    @bro = Bro.find(params['id'])
    @bros = Bro.all
    @moustaches = Moustache.all
  end

end