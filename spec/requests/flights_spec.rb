require 'rails_helper'
require 'spec_helper'

RSpec.describe FlightsController, type: :controller  do

   render_views
   let!(:flight0) { Flight.create(:destination => "Portland") }
   
   it "Get Test" do
     puts 'Get Test'
     puts 'Flight count is ' + Flight.count.to_s
     
     get :index, :format => :json
     
     puts "Body = " + response.body
     expect(response.body).to include('Portland')
   end

   it "Post Test" do
    puts 'Post Test'

    post :create, :flight => {:destination => "San Francisco"}

    puts "Post status:" + response.status.to_s

    expect(response).to redirect_to(assigns(:flight))
    redirect_to(response.headers['Location'])

    get :index, :format => :json
    puts "Body = " + response.body
    
    expect(response.body).to include("San Francisco")
    puts 'Flight count is ' + Flight.count.to_s
  end

  it "Update Test" do
    puts 'Update Test'
    puts 'Flight count is ' + Flight.count.to_s

    put :update, :id => flight0, :flight => {:destination => "Seattle"}

    expect(response).to redirect_to(assigns(:flight))  
    redirect_to(response.headers['Location'])

    get :index, :format => :json
    puts "Body = " + response.body
    expect(response.body).to include('Seattle')
    puts 'Flight count is ' + Flight.count.to_s
    
  end

  it "Delete Test" do
    puts 'Delete test'
    puts 'Flight count is ' + Flight.count.to_s
    delete :destroy, :id => flight0

    expect(response).to redirect_to(assigns(:flight))  
    redirect_to(response.headers['Location'])

    puts 'Flight count is ' + Flight.count.to_s
  end 

end