class SentencesController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_sentence, only: [:show, :edit, :update, :destroy]

  # GET /sentences
  # GET /sentences.json
  def index
    @sentences = Sentence.all
  end

  # GET /sentences/1
  # GET /sentences/1.json
  def show
  end

  # GET /sentences/new
  def new
    @sentence = Sentence.new
  end

  # GET /sentences/1/edit
  def edit
  end

  # POST /sentences
  # POST /sentences.json
  def create
    puts "sentence_params: #{sentence_params}"
    @sentence = Sentence.find_or_create_by(sentence_params)

    respond_to do |format|
      if @sentence.save
        format.html { redirect_to @sentence, notice: 'Sentence was successfully created.' }
        format.json { render :show, status: :created, location: @sentence }
      else
        format.html { render :new }
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sentences/1
  # PATCH/PUT /sentences/1.json
  def update
    respond_to do |format|
      if @sentence.update(sentence_params)
        format.html { redirect_to @sentence, notice: 'Sentence was successfully updated.' }
        format.json { render :show, status: :ok, location: @sentence }
      else
        format.html { render :edit }
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.json
  def destroy
    @sentence.destroy
    respond_to do |format|
      format.html { redirect_to sentences_url, notice: 'Sentence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sentence_params
      params.permit(:sentence, :language_code, :source_id, :tokens_count)
    end
end
