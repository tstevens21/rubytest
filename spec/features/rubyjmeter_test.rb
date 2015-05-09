require 'ruby-jmeter'

test do
  with_json
  threads 1, loops: 5 do
    get name: 'get flights',
        url: 'http://localhost:3000/flights'
    
    visit name:'flights', url:'http://localhost:3000/flights' do
    
    end
  end
end.jmx

##run('/home/ted/Downloads/apache-jmeter-2.13/bin/jmeter')
