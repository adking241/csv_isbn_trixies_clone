require "sinatra"
require_relative "isbn.rb"


get '/'  do
	redirect '/form'
end

get '/form' do
	erb :isbnform
end

post '/check' do
	isbn_input = params[:isbn_input]
	results = run_program(isbn_input).to_s
	"results = #{results}"
	redirect '/confirm?isbn_input=' + isbn_input + '&results=' + results
end

get '/confirm' do
	isbn_input = params[:isbn_input]
	results = run_program(isbn_input).to_s
	erb :confirm, :locals => {:isbn_input => isbn_input, :results => results}
end