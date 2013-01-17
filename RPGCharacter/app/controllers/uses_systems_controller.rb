class UsesSystemsController < ApplicationController
  # GET /uses_systems
  # GET /uses_systems.json
  def index
    @uses_systems = UsesSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uses_systems }
    end
  end

  # GET /uses_systems/1
  # GET /uses_systems/1.json
  def show
    @uses_system = UsesSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uses_system }
    end
  end

  # GET /uses_systems/new
  # GET /uses_systems/new.json
  def new
    @uses_system = UsesSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uses_system }
    end
  end

  # GET /uses_systems/1/edit
  def edit
    @uses_system = UsesSystem.find(params[:id])
  end

  # POST /uses_systems
  # POST /uses_systems.json
  def create
    @uses_system = UsesSystem.new(params[:uses_system])

    respond_to do |format|
      if @uses_system.save
        format.html { redirect_to @uses_system, notice: 'Uses system was successfully created.' }
        format.json { render json: @uses_system, status: :created, location: @uses_system }
      else
        format.html { render action: "new" }
        format.json { render json: @uses_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uses_systems/1
  # PUT /uses_systems/1.json
  def update
    @uses_system = UsesSystem.find(params[:id])

    respond_to do |format|
      if @uses_system.update_attributes(params[:uses_system])
        format.html { redirect_to @uses_system, notice: 'Uses system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @uses_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uses_systems/1
  # DELETE /uses_systems/1.json
  def destroy
    @uses_system = UsesSystem.find(params[:id])
    @uses_system.destroy

    respond_to do |format|
      format.html { redirect_to uses_systems_url }
      format.json { head :no_content }
    end
  end
end
