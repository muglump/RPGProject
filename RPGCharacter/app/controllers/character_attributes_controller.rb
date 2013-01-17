class CharacterAttributesController < ApplicationController
  # GET /character_attributes
  # GET /character_attributes.json
  def index
    @character_attributes = CharacterAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @character_attributes }
    end
  end

  # GET /character_attributes/1
  # GET /character_attributes/1.json
  def show
    @character_attribute = CharacterAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_attribute }
    end
  end

  # GET /character_attributes/new
  # GET /character_attributes/new.json
  def new
    @character_attribute = CharacterAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character_attribute }
    end
  end

  # GET /character_attributes/1/edit
  def edit
    @character_attribute = CharacterAttribute.find(params[:id])
  end

  # POST /character_attributes
  # POST /character_attributes.json
  def create
    @character_attribute = CharacterAttribute.new(params[:character_attribute])

    respond_to do |format|
      if @character_attribute.save
        format.html { redirect_to @character_attribute, notice: 'Character attribute was successfully created.' }
        format.json { render json: @character_attribute, status: :created, location: @character_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /character_attributes/1
  # PUT /character_attributes/1.json
  def update
    @character_attribute = CharacterAttribute.find(params[:id])

    respond_to do |format|
      if @character_attribute.update_attributes(params[:character_attribute])
        format.html { redirect_to @character_attribute, notice: 'Character attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_attributes/1
  # DELETE /character_attributes/1.json
  def destroy
    @character_attribute = CharacterAttribute.find(params[:id])
    @character_attribute.destroy

    respond_to do |format|
      format.html { redirect_to character_attributes_url }
      format.json { head :no_content }
    end
  end
end
