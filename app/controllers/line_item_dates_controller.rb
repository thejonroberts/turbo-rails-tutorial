class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      # NOTE: New record line_items violate strict loading, for some reason.
      # - cannot .includes(:line_items) above, no id until saved.
      # - may be able to build with empty associations ???
      # Next two lines both solve the issue, I'm not sure which is better.
      # ActiveRecord::Associations::Preloader.new(records: [@line_item_date], associations: [:line_items]).call
      @line_item_date.strict_loading!(mode: :n_plus_one_only)
      respond_to do |format|
        notice = "Date was successfully created."
        format.html { redirect_to quote_path(@quote), notice: }
        format.turbo_stream { flash.now[:notice] = notice }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        notice = "Date was successfully updated."
        format.html { redirect_to quote_path(@quote), notice: }
        format.turbo_stream { flash.now[:notice] = notice }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy

    respond_to do |format|
      notice = "Date was successfully destroyed."
      format.html { redirect_to quote_path(@quote), notice: }
      format.turbo_stream { flash.now[:notice] = notice }
    end
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.includes(:line_items).find(params[:id])
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
