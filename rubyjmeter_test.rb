require 'ruby-jmeter'

test do
  with_json
  threads 1, loops: 5 do
         visit name:'flights', url:'http://localhost:3000/flights' do
      
         end
         transaction name: 'Post with a Raw Body', parent: false do 
           post name: 'post a flight', url: 'http://localhost:3000/flights/#new', 
           raw_body: 'flight[destination]=Orange County' 
           extract name: 'FLIGHTNUM', regex: 'flights\/(\d+)'
         end 
         transaction name: 'Divert to Phoenix', parent: false do

           put name: 'divert to phoenix', raw_path:true, url: 'http://localhost:3000/flights/${FLIGHTNUM}?flight[destination]=Phoenix' do
           end
         end
         transaction name: 'Cancel flight due to bad weather', parent: false do
           delete name: 'delete flight to Phoenix ', url: "http://localhost:3000/flights/${FLIGHTNUM}" do
           end
         end
  end
end.jmx

