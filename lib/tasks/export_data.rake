namespace :export_data do
  desc "Export data from db"

  task sentiment_sources: :environment do
    sentiments = Sentiment.joins(:source)
    .where(sources: {published_date:  Date.new(2019,1,1).to_datetime..Date.new(2019,1,31).to_datetime})

    sentiment_sources = {}

    sentiments.each do |sentiment|

      positive = false
      negative = false

      if sentiment.positive > 0
        positive = true
      elsif sentiment.negative > 0
        negative = true
      end


      sentiment_source = sentiment.source.url.split("/")[2]

      if not sentiment_sources[sentiment.entity.name]
        sentiment_sources[sentiment.entity.name] = {positive: [], negative: []}
      end

      if positive
        sentiment_sources[sentiment.entity.name][:positive] << sentiment_source
      elsif negative
        sentiment_sources[sentiment.entity.name][:negative] << sentiment_source
      end
    end

    File.open("/home/th3go2/disses-and-compliments-analysis/data/sentiment_sources.json","w") do |f|
      f.write(sentiment_sources.to_json)
    end

  end

  task sentiment_trends: :environment do
    sentiments = Sentiment.joins(:source)
    .where(sources: {published_date: Date.new(2019,1,1).to_datetime..Date.new(2019,1,31).to_datetime})

    entity_trend = {}

    sentiments.each do |sentiment|

      positive = false
      negative = false

      if sentiment.positive > 0
        positive = true
      elsif sentiment.negative > 0
        negative = true
      end
      sentiment_date = sentiment.source.published_date.to_date
      sentiment_date_str = "#{sentiment_date.year}-#{sentiment_date.month}-#{sentiment_date.day}"
      if not entity_trend[sentiment.entity.name]
        entity_trend[sentiment.entity.name] = {positive: [], negative: []}
      end

      if positive
        entity_trend[sentiment.entity.name][:positive] << sentiment_date_str
      elsif negative
        entity_trend[sentiment.entity.name][:negative] << sentiment_date_str
      end
    end

    File.open("/home/th3go2/disses-and-compliments-analysis/data/sentiment_trend.json","w") do |f|
      f.write(entity_trend.to_json)
    end

  end

  task entity_counts: :environment do
    sentiments = Sentiment.joins(:source)
    .where(sources: {published_date: Date.new(2019,1,1).to_datetime..Date.new(2019,1,31).to_datetime})


    negative_counts = Hash.new(0)
    positive_counts = Hash.new(0)
    all_counts = Hash.new(0)


    sentiments.each do |sentiment|

      entity_name = sentiment.entity.name

      all_counts[entity_name] += 1

      if sentiment.positive > 0
        positive_counts[entity_name] += 1
      elsif sentiment.negative > 0
        negative_counts[entity_name] += 1
      end
    end

    File.open("/home/th3go2/disses-and-compliments-analysis/data/all_counts.json","w") do |f|
      f.write(all_counts.to_json)
    end

    File.open("/home/th3go2/disses-and-compliments-analysis/data/positive_counts.json","w") do |f|
      f.write(positive_counts.to_json)
    end

    File.open("/home/th3go2/disses-and-compliments-analysis/data/negative_counts.json","w") do |f|
      f.write(negative_counts.to_json)
    end


  end

end
