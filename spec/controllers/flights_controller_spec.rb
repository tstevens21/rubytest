require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  describe 'GET index' do
    @flights = Flight.all
  end

   # GET /flights/new
  def new
    @flight = Flight.new
  end  
end
