class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = find_cat
    if @cat
      render :show
    else
      redirect_to cats_url, status: 404
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def update
    @cat = find_cat
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def edit
    @cat = find_cat
    render :edit
  end

  def destroy
    @cat = find_cat
    if @cat
      @cat.destroy
      render :index
    else
      render json: "Can't find cat to delete", status: 404
    end
  end

  private

  def find_cat
    Cat.find_by(id: params[:id])
  end

  def cat_params
    params.require(:cat).permit(:id, :name, :color, :sex, :description, :birth_date)
  end

end
