class EntitySourcesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_entity_source, only: [:show, :edit, :update, :destroy]

  # GET /entity_sources
  # GET /entity_sources.json
  def index
    @entity_sources = EntitySource.all
  end

  # GET /entity_sources/1
  # GET /entity_sources/1.json
  def show
  end

  # GET /entity_sources/new
  def new
    @entity_source = EntitySource.new
  end

  # GET /entity_sources/1/edit
  def edit
  end

  # POST /entity_sources
  # POST /entity_sources.json
  def create
    @entity_source = EntitySource.find_or_create_by(entity_source_params)

    respond_to do |format|
      if @entity_source.save
        format.html { redirect_to @entity_source, notice: 'Entity source was successfully created.' }
        format.json { render :show, status: :created, location: @entity_source }
      else
        format.html { render :new }
        format.json { render json: @entity_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity_sources/1
  # PATCH/PUT /entity_sources/1.json
  def update
    respond_to do |format|
      if @entity_source.update(entity_source_params)
        format.html { redirect_to @entity_source, notice: 'Entity source was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity_source }
      else
        format.html { render :edit }
        format.json { render json: @entity_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_sources/1
  # DELETE /entity_sources/1.json
  def destroy
    @entity_source.destroy
    respond_to do |format|
      format.html { redirect_to entity_sources_url, notice: 'Entity source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_source
      @entity_source = EntitySource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_source_params
      params.require(:entity_source).permit(:entity_id, :source_id)
    end
end
