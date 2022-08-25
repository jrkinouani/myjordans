class BookingsController < ApplicationController

	def new
		@basket = Basket.find(params[:basket_id])
		@booking = Booking.new
	end

	def create
		@basket = Basket.find(params[:basket_id])
		@booking = Booking.new(bookings_params)
		@booking.basket = @basket
		@booking.user = current_user
		@booking.status = "pending"
		if @booking.save
			redirect_to dashboard_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def accept
		@booking = Booking.find(params[:id])
		@booking.update(status: "accepted")
		if @booking.save 
			redirect_to dashboard_path
		end
	end

	def decline
		@booking = Booking.find(params[:id])
		@booking.update(status: "declined")
		if @booking.save 
			redirect_to dashboard_path
		end
	end

	def cancel
		@booking = Booking.find(params[:id])
		@booking.update(status: "canceled")
		if @booking.save 
			redirect_to dashboard_path
		end
	end


	private

	def bookings_params
		params.require(:booking).permit(:start_date, :end_date)
	end
end
