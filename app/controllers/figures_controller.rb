class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if !params[:figure][:title_ids].nil?
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end

    if !params[:title][:name].strip.empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:figure][:landmark_ids].nil?
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end

    if !params[:landmark][:name].strip.empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])

    @figure.name = params[:figure][:name]

    if !params[:figure][:title_ids].nil?
      params[:figure][:title_ids].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end

    if !params[:title][:name].strip.empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if !params[:figure][:landmark_ids].nil?
      params[:figure][:landmark_ids].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end

    if !params[:landmark][:name].strip.empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
