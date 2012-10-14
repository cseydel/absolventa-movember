class BrosController < ApplicationController
  # GET /bros
  # GET /bros.json
  def index
    @bros = Bro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bros }
    end
  end

  # GET /bros/1
  # GET /bros/1.json
  def show
    @bro = Bro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bro }
    end
  end

  # GET /bros/new
  # GET /bros/new.json
  def new
    @bro = Bro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bro }
    end
  end

  # GET /bros/1/edit
  def edit
    @bro = Bro.find(params[:id])
  end

  # POST /bros
  # POST /bros.json
  def create
    @bro = Bro.new(params[:bro])

    respond_to do |format|
      if @bro.save
        format.html { redirect_to @bro, notice: 'Bro was successfully created.' }
        format.json { render json: @bro, status: :created, location: @bro }
      else
        format.html { render action: "new" }
        format.json { render json: @bro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bros/1
  # PUT /bros/1.json
  def update
    @bro = Bro.find(params[:id])

    respond_to do |format|
      if @bro.update_attributes(params[:bro])
        format.html { redirect_to @bro, notice: 'Bro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bros/1
  # DELETE /bros/1.json
  def destroy
    @bro = Bro.find(params[:id])
    @bro.destroy

    respond_to do |format|
      format.html { redirect_to bros_url }
      format.json { head :no_content }
    end
  end
end
