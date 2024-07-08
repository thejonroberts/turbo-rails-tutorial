class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = current_company.quotes.desc_id_ordered
  end

  def show
    @line_item_dates = @quote.line_item_dates.includes(:line_items).ordered
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        notice = "Quote was successfully created."
        format.html { redirect_to quotes_path, notice: }
        format.turbo_stream { flash.now[:notice] = notice }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        notice = "Quote was successfully updated."
        format.html { redirect_to quotes_path, notice: }
        format.turbo_stream { flash.now[:notice] = notice }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      notice = "Quote was successfully destroyed."
      format.html { redirect_to quotes_path, notice: }
      format.turbo_stream { flash.now[:notice] = notice }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes
      .includes(:line_item_dates, :line_items)
      .find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
