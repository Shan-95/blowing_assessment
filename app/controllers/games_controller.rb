class GamesController < ApplicationController
	before_action :set_game

	def roll
		return render json: {message: "game completed", data: @game} if !@game.frames.where(is_completed: false).present?
		last_frame = @game.frames.where(is_completed: true).last
		@current_chance.update(chance_score: params[:pins],is_completed: true) if params[:pins].present?
		if @current_frame.chances.first.chance_score == 10
			@current_frame.update(is_completed: true, frame_type: "strike", frame_score: @current_chance.chance_score)
		elsif @current_frame.chances.pluck(:chance_score).sum == 10
			@current_frame.update(is_completed: true, frame_type: "spare", frame_score: @current_frame.chances.pluck(:chance_score).sum)
		else
			@current_frame.update(frame_score: @current_frame.frame_score + @current_chance.chance_score)
		end	
		@current_frame.update(is_completed: true) if @current_frame.chances.last.is_completed.eql?(true)
		last_frame.update(frame_score: last_frame.frame_score + @current_frame.frame_score) if last_frame&.frame_type.eql?("strike") && @current_chance.chance_no.eql?(2) 
		last_frame.update(frame_score: last_frame.frame_score + @current_chance.chance_score) if last_frame&.frame_type.eql?("spare") && @current_chance.chance_no.eql?(1) 
		@game.update(total_score: @game.frames.pluck(:frame_score).sum)
		
		return render json: {data: @game,  message: 'Roll successful!' }, status: :ok
	end
	
	private
	
	def set_game
		@game = Game.find_or_create_by(user: params[:user])
		@current_frame = @game.frames.where(is_completed: false).first
		@current_chance = @current_frame.chances.where(is_completed: false).first
		pins_left = 10 - @current_frame.frame_score
		return render json: {message: "only #{pins_left} pins left"}, status: 422 if pins_left < params[:pins].to_i
	end
end
