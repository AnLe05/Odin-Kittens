class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy]
  def index 
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens}
    end 
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @kittens}
    end 
  end 

  def new 
    @kitten = Kitten.new 
  end 

  def create 
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Successfully added kitten!"
      redirect_to @kitten
    else
      flash.now[:alert] = "Failed to add kitten. Check your form."
      render :new
    end
  end
  
  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "Successfully updated kitten!"
      redirect_to @kitten
    else 
      flash.now[:alert] = "Falied to update kitchen. Try again!"
      render :edit
    end
  end 
  def destroy
    @kitten.destroy
    flash[:notice] = "Kitten deleted 🐾"
    redirect_to kittens_path
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end


end
