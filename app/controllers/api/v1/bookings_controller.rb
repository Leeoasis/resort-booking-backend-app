module Api
  module V1
    class BookingsController < ApplicationController
      before_action :set_booking, only: %i[show update destroy]
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user!
      load_and_authorize_resource


      def index
        @bookings = Booking.all
        render json: @bookings
      end

      def show
        render json: @booking
      end

      def create
        @booking = Booking.new(booking_params)
        if @booking.save
          render json: @booking, status: :created
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end

      def update
        if @booking.update(booking_params)
          render json: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @booking.destroy
        head :no_content
      end

      private

      def set_booking
        @booking = Booking.find(params[:id])
      end

      def booking_params
        params.require(:booking).permit(:customer_name, :contact_information, :reservation_date, :duration, :num_guests)
      end
    end
  end
end
