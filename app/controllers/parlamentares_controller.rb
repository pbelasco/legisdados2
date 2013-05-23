class ParlamentaresController < ApplicationController
  # GET /parlamentares
  # GET /parlamentares.json
  def index
    @parlamentares = Parlamentar.all

    @parlamentares = @parlamentares.where :partido => params[:partido] unless params[:partido]..nil?
    @parlamentares = @parlamentares.where :sexo => params[:sexo] unless params[:sexo].nil?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parlamentares }
    end
  end

  # GET /parlamentares/1
  # GET /parlamentares/1.json
  def show
    @parlamentar = Parlamentar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parlamentar }
    end
  end

  # GET /parlamentares/new
  # GET /parlamentares/new.json
  def new
    @parlamentar = Parlamentar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @parlamentar }
    end
  end

  # GET /parlamentares/1/edit
  def edit
    @parlamentar = Parlamentar.find(params[:id])
  end

  # POST /parlamentares
  # POST /parlamentares.json
  def create
    @parlamentar = Parlamentar.new(params[:parlamentar])

    respond_to do |format|
      if @parlamentar.save
        format.html { redirect_to @parlamentar, notice: 'Parlamentar was successfully created.' }
        format.json { render json: @parlamentar, status: :created, location: @parlamentar }
      else
        format.html { render action: "new" }
        format.json { render json: @parlamentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parlamentares/1
  # PUT /parlamentares/1.json
  def update
    @parlamentar = Parlamentar.find(params[:id])

    respond_to do |format|
      if @parlamentar.update_attributes(params[:parlamentar])
        format.html { redirect_to @parlamentar, notice: 'Parlamentar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @parlamentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parlamentares/1
  # DELETE /parlamentares/1.json
  def destroy
    @parlamentar = Parlamentar.find(params[:id])
    @parlamentar.destroy

    respond_to do |format|
      format.html { redirect_to parlamentares_url }
      format.json { head :no_content }
    end
  end
end
