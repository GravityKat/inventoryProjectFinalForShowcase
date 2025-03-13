class ItemsController < ApplicationController
  before_action :set_centre
  before_action :set_item, only: [:update, :destroy]

  def create
    @item = @centre.items.new(item_params)

    if @item.save
      redirect_to centre_path(@centre), notice: "Item added successfully!"
    else
      redirect_to centre_path(@centre), alert: "Failed to add item."
    end
  end

  def update
    if @item.update(item_params)
      redirect_to centre_path(@centre), notice: "Item updated successfully!"
    else
      redirect_to centre_path(@centre), alert: "Failed to update item."
    end
  end

  def destroy
    if @item.destroy
      redirect_to centre_path(@centre), notice: "Item deleted successfully!"
    else
      redirect_to centre_path(@centre), alert: "Failed to delete item."
    end
  end

  private

  def set_centre
    @centre = Centre.find(params[:centre_id])
  end

  def set_item
    @item = @centre.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :stock, :category_id)
  end
end