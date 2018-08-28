class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  
  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
    render :form
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to page_path(@page)
    else
      render :form
    end
  end

  def edit
    render :form
  end

  def update

    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render :form
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :author)
  end

  def set_page
    @page = Page.find(params[:id])
  end


end
