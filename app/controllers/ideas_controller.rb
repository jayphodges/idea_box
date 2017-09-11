class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_auth

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def edit
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def require_auth
      redirect_to login unless current_user
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:content, :category_id)
    end

end
