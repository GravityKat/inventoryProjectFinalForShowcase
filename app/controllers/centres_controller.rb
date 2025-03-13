class CentresController < ApplicationController
  def index
    @centres = Centre.all
    @centre = Centre.new
  
    # Include category in the Ransack search
    @q = Item.ransack(params[:q])
    @items = params[:q].present? ? @q.result.includes(:centre, :category) : []
  end

  def create
    @centre = Centre.new(centre_params)
  
    if @centre.save
      redirect_to centres_path, notice: "Centre added successfully!"
    else
      flash.now[:alert] = "Please enter text"
      render :index, status: :unprocessable_entity  # ✅ Re-renders form with errors
    end
  end

  def create
    @centre = Centre.new(centre_params)
    if @centre.save
      redirect_to @centre
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @centre = Centre.find(params[:id])
    @items = @centre.items.presence || []  # ✅ Ensures @items is always an array
  end

  def suggestions
    if params[:q].present?
      results = Item.where("LOWER(name) LIKE ?", "%#{params[:q].downcase}%")
                    .distinct  # ✅ Prevent duplicate records from being retrieved
                    .limit(5)
                    .pluck(:name)
    else
      results = []
    end
    render json: results.uniq  # ✅ Ensures names are unique before returning
  end

  private
  def centre_params
    params.expect(centre: [ :name ])
  end
end
