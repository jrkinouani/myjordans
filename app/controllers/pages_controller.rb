class PagesController < ApplicationController
    # skip_before_action :authenticate_user!, only: :home
  def home
    @baskets = Basket.all
  end

  def search
    @baskets = Basket.all
    if params[:search]
    @baskets = Basket.search(params[:search]).order("created_at DESC")
    else
    @books = Basket.all.order('created_at DESC')
    end

    def dashboard
      
    end
  end
end
