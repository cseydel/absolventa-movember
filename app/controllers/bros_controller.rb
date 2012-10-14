class BrosController < ApplicationController

  def show

    @bro = Bro.find(params['id'])

  end

  def create
    @bro = Bro.create( params[:bro] )
  end

end