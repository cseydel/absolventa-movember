class BroController < ApplicationController

  def show

    @bro = Bro.find(params['id'])

  end

end
