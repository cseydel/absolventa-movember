class MoustachesController < ApplicationController
  # GET /moustaches
  # GET /moustaches.json
  def index
    @moustaches = Moustache.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moustaches }
    end
  end

  # GET /moustaches/1
  # GET /moustaches/1.json
  def show
    @moustach = Moustache.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moustach }
    end
  end

  # GET /moustaches/new
  # GET /moustaches/new.json
  def new
    @moustach = Moustache.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moustach }
    end
  end

  # GET /moustaches/1/edit
  def edit
    @moustach = Moustache.find(params[:id])
  end

  # POST /moustaches
  # POST /moustaches.json
  def create
    @moustach = Moustache.new(params[:moustach])

    respond_to do |format|
      if @moustach.save
        format.html { redirect_to @moustach, notice: 'Moustache was successfully created.' }
        format.json { render json: @moustach, status: :created, location: @moustach }
      else
        format.html { render action: "new" }
        format.json { render json: @moustach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moustaches/1
  # PUT /moustaches/1.json
  def update
    @moustach = Moustache.find(params[:id])

    respond_to do |format|
      if @moustach.update_attributes(params[:moustach])
        format.html { redirect_to @moustach, notice: 'Moustache was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moustach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moustaches/1
  # DELETE /moustaches/1.json
  def destroy
    @moustach = Moustache.find(params[:id])
    @moustach.destroy

    respond_to do |format|
      format.html { redirect_to moustaches_url }
      format.json { head :no_content }
    end
  end
end
