class BasketsController < ApplicationController
  before_action :set_basket, only: %i[edit show destroy update]

  def index
    @baskets = Basket.all
  end

  def show
  end

  def new
    @basket = Basket.new
  end

  def create
    @basket = Basket.new(params_basket)
    @basket.user = current_user
    if @basket.save
      redirect_to basket_path(@basket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @basket.update(params_basket)
    redirect_to basket_path(@basket)
  end

  def destroy
    @basket.destroy
    redirect_to baskets_path, status: :see_other
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

  def params_basket
    params.require(:basket)
          .permit(:name, :size, :description, :price_per_day, post_attachments_attributes: [:id, :post_id, {
                    image: []
                  }])
  end
end
