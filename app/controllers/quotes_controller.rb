class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

# since we moved our form into our modal, we don't need the actual page where the form was running before anymore
#  def new
#    @quote = Quote.new
#  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
