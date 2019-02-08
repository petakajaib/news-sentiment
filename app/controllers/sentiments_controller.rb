class SentimentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_sentiment, only: [:show, :edit, :update, :destroy]

  # GET /sentiments
  # GET /sentiments.json
  def index
    if params.key? :order
      if params.key? :direction

        case params[:direction]
        when "asc"
          direction = :asc
        when "desc"
          direction = :desc
        end

        case params[:order]
        when "entity"

          @sentiments = Sentiment
            .paginate(page: params[:page])
            .joins(:entity)
            .merge(Entity.order(name: direction))

        when "entity_type"
          @sentiments = Sentiment
            .paginate(page: params[:page])
            .joins(:entity)
            .merge(Entity.order(tag: direction))

        when "positive"
          @sentiments = Sentiment
            .paginate(page: params[:page])
            .order(positive: direction)
        when "negative"
          @sentiments = Sentiment
            .paginate(page: params[:page])
            .order(negative: direction)
        when "evidence"
          @sentiments = Sentiment
            .paginate(page: params[:page])
            .order(source_id: direction)
        when "published_date"
          @sentiments = Sentiment
            .paginate(page: params[:page])
            .joins(:source)
            .merge(Source.order(published_date: direction))
        end

      end
    else
      @sentiments = Sentiment
        .paginate(page: params[:page])
        .joins(:source)
        .merge(Source.order(published_date: :desc))

    end

    @params = {}

    params.each do |k,v|
      if (k != :page) && (k != "controller") && (k != "action")
        @params[k] = v
      end
    end

    if params.key? :published_date
      @sentiments = @sentiments
        .joins(:source)
        .where(sources: {published_date: params[:published_date].to_date.to_datetime..params[:published_date].to_date.to_datetime+1.day})

    end

    if params.key? :entity_id
      @sentiments = @sentiments
        .where(entity_id: params[:entity_id])
    end
    if params.key? :entity_tag
      @sentiments = @sentiments
        .joins(:entity)
        .where(entities: {tag: params[:entity_tag]})
    end

    if params.key? :source_id
      @sentiments = @sentiments
        .where(source_id: params[:source_id])
    end

    if params.key? :sentiment
      if params[:sentiment] == "positive"
        @sentiments = @sentiments
          .where("positive > 0.0")
      elsif params[:sentiment] == "negative"
        @sentiments = @sentiments
          .where("negative > 0.0")
      end
    end

    # @sentiments = @sentiments.joins(:source)
    # .where(sources: {published_date: Date.new(2019,1,1).to_datetime..Date.new(2019,1,31).to_datetime})

  end

  # GET /sentiments/1
  # GET /sentiments/1.json
  def show
  end

  # GET /sentiments/new
  def new
    @sentiment = Sentiment.new
  end

  # GET /sentiments/1/edit
  def edit
  end

  # POST /sentiments
  # POST /sentiments.json
  def create


    @sentiment = Sentiment.find_or_create_by(sentiment_params)

    respond_to do |format|
      if @sentiment.save
        format.html { redirect_to @sentiment, notice: 'Sentiment was successfully created.' }
        format.json { render :show, status: :created, location: @sentiment }
      else
        format.html { render :new }
        format.json { render json: @sentiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sentiments/1
  # PATCH/PUT /sentiments/1.json
  def update
    respond_to do |format|
      if @sentiment.update(sentiment_params)
        format.html { redirect_to @sentiment, notice: 'Sentiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @sentiment }
      else
        format.html { render :edit }
        format.json { render json: @sentiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentiments/1
  # DELETE /sentiments/1.json
  def destroy
    @sentiment.destroy
    respond_to do |format|
      format.html { redirect_to sentiments_url, notice: 'Sentiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentiment
      @sentiment = Sentiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sentiment_params
      params.permit(
          :positive,
          :negative,
          :sentence_id,
          :source_id,
          :entity_id,
          :sentiment
          )
    end
end
