require 'json'
require 'net/http'
require "uri"

def request
	uri = URI.parse("http://aerial-valor-93012.appspot.com/challenge")
	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Get.new(uri.request_uri)
	request.initialize_http_header({})
	response = http.request(request)
	response.body
end

def splitToArray(input)
	array = input.scan(/\w+/) 
end

def defineToken(array)
	return array[1]
end

def addSum(array)
	array.slice!(0..2)
	sum = 0
	array.each do |i|
		sum += i.to_i
	end
	return sum
end

def answer(token, sum)
	answer = URI.parse("http://aerial-valor-93012.appspot.com/challenge/#{token}/#{sum}")
	http = Net::HTTP.new(answer.host, answer.port)
	request = Net::HTTP::Get.new(answer.request_uri)
	request.initialize_http_header({})
	response = http.request(request)
	response.body
end

array = splitToArray(request)
token = defineToken(array)
sum = addSum(array)
puts answer(token, sum)