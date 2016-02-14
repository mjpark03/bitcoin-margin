

class BitcoinController < ApplicationController
  def index
  end

  def show
  	require 'httparty'
  	require 'json'
  	puts ("[mjpark] bitcoin/show")

  	url_korbit = "https://api.korbit.co.kr/v1/ticker"
  	bitcoin_korbit = HTTParty.get(url_korbit)
  	puts (bitcoin_korbit)
  	korbit_data = JSON.parse(bitcoin_korbit)

  	url_coinone = "https://api.coinone.co.kr/ticker/"
  	bitcoin_coinone = HTTParty.get(url_coinone)
  	puts (bitcoin_coinone)
  	coinone_data = JSON.parse(bitcoin_coinone.body)

  	bitcoin_korbit_obj = Bitcoin.new
  	bitcoin_korbit_obj.company = "korbit"
  	bitcoin_korbit_obj.last = korbit_data["last"]
  	printf("%s : %s \n", bitcoin_korbit_obj.company, bitcoin_korbit_obj.last)
  	bitcoin_korbit_obj.save

  	# if Bitcoin.where(company: 'korbit').empty? 
  	# 	bitcoin_korbit_obj.save
  	# end
  	
  	bitcoin_coinone_obj = Bitcoin.new
  	bitcoin_coinone_obj.company = "coinone"
  	bitcoin_coinone_obj.last = coinone_data["last"]
  	printf("%s : %s\n", bitcoin_coinone_obj.company, bitcoin_coinone_obj.last)
  	bitcoin_coinone_obj.save

  	# if Bitcoin.where(company: 'coinone').empty?
  	# 	bitcoin_coinone_obj.save
  	# end

  	@bitcoins = Bitcoin.all
  	@korbit = korbit_data["last"]
  	@coinone = coinone_data["last"]

  end

end
