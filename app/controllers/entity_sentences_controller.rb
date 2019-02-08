class EntitySentencesController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_entity_sentence, only: [:show, :edit, :update, :destroy]

  # GET /entity_sentences
  # GET /entity_sentences.json
  def index
    @entity_sentences = EntitySentence.all
  end

  # GET /entity_sentences/1
  # GET /entity_sentences/1.json
  def show
  end

  # GET /entity_sentences/new
  def new
    @entity_sentence = EntitySentence.new
  end

  # GET /entity_sentences/1/edit
  def edit
  end

  # POST /entity_sentences
  # POST /entity_sentences.json
  def create
    @entity_sentence = EntitySentence.find_or_create_by(entity_sentence_params)

    respond_to do |format|
      if @entity_sentence.save
        format.html { redirect_to @entity_sentence, notice: 'Entity sentence was successfully created.' }
        format.json { render :show, status: :created, location: @entity_sentence }
      else
        format.html { render :new }
        format.json { render json: @entity_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity_sentences/1
  # PATCH/PUT /entity_sentences/1.json
  def update
    respond_to do |format|
      if @entity_sentence.update(entity_sentence_params)
        format.html { redirect_to @entity_sentence, notice: 'Entity sentence was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity_sentence }
      else
        format.html { render :edit }
        format.json { render json: @entity_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_sentences/1
  # DELETE /entity_sentences/1.json
  def destroy
    @entity_sentence.destroy
    respond_to do |format|
      format.html { redirect_to entity_sentences_url, notice: 'Entity sentence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_sentence
      @entity_sentence = EntitySentence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_sentence_params
      params.permit(:entity_id, :sentence_id)
    end
end
