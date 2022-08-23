class PagesController < ApplicationController
    # skip_before_action :authenticate_user!, only: :home
  def home
    @baskets = Basket.all
  end
end
