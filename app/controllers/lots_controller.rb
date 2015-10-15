class LotsController < ApplicationController
  require 'rest-client'

  def index
    @lots = Lot.all
  end

  def show
   @lot = Lot.find(params[:id])
  end

  def new

    @lot = Lot.new

    response = RestClient.get 'http://localhost:3111/api/dispatch' , {:params => {'yard_num' => 1}}
    # puts response

    @@array = Array.new
    @@array.clear

    @webServiceResponse = JSON.parse(response)

    puts @webServiceResponse.length


    @webServiceResponse.each do |r|
      address1 = r["lmlocad1"].strip!
      city = r["lmloccty"].strip! rescue nil
      state = r["lmlocstt"] rescue nil
      zip = r["lmloczip"] rescue nil
      country = r["lmlocctr"] rescue nil

      addressTemp = (address1.blank?) ? (city + "," + state + "," + zip + "," + country) : (address1 + "," + city + "," + state + "," + zip + "," + country)
      @@array << addressTemp
    end

    puts @@array.length

  end

  #no new required
  def create

    @@array.each do |address|
      @lot = Lot.new(address: address)
      @lot.save
      # puts address
    end

    # puts params[:address]
    # @lot = Lot.new(address: params[:lot][:address])
    # @lot.save

    # @article = Article.new(title: params[:title], text: params[:body])
    # @article.save

    # puts params[:address]


    # @lot = Lot.create(address: params[:address])
    # @lot.save
    #
    redirect_to :controller => 'lots' , :action => 'index'
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  #no new required
  def update

  end

  def destroy

  end
end
