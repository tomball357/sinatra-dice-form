

require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


  # Route to process dice rolls
get "/process_roll" do
  # Get query parameters, default to 1 die with 6 sides if missing
  @num_dice = params[:dice].to_i > 0 ? params[:dice].to_i : 1
  @sides = params[:sides].to_i > 0 ? params[:sides].to_i : 6

  # Generate random rolls
  @rolls = Array.new(@num_dice) { rand(1..@sides) }

  erb :process_roll
end

