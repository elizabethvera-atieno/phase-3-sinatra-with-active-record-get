class ApplicationController < Sinatra::Base

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  # get '/game/:id' do
  #   game = Game.find(params[:id])
  #   game.to_json(include: {reviews: {include: :user}})
  # end

  # get '/game' do
  #   game = Game.all.order(:genre).limit(1)

  #   # include associated reviews in the JSON response
  #   game.to_json(only: [:id, :title, :genre, :price], include: {
  #     reviews: { only: [:comment, :score], include: {
  #       user: { only: [:name] }
  #     } }
  #   })
  # end

  get '/games/:id' do
    game = Game.find(params[:id])

    # include associated reviews in the JSON response
    game.to_json(only: [:id, :title, :genre, :price], include: {
      reviews: { only: [:comment, :score], include: {
        user: { only: [:name] }
      } }
    })
  end

end