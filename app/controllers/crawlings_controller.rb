class CrawlingsController < ApplicationController
  before_action :set_crawling, only: [:show, :edit, :update, :destroy]

  # GET /crawlings
  # GET /crawlings.json
  def index
    @crawlings = Crawling.all
  end

  # GET /crawlings/1
  # GET /crawlings/1.json
  def show

  end

  # GET /crawlings/new
  def new
    @crawling = Crawling.new
  end

  # GET /crawlings/1/edit
  def edit
  end

  # POST /crawlings
  # POST /crawlings.json
  def create
    @doc = Nokogiri::HTML(open(params[:crawlings][:url1]),nil,"utf-8")
    @doc.css('a').each do |element|
      binding.pry
      element[:href]
      element[:children]
    end

  end

  # PATCH/PUT /crawlings/1
  # PATCH/PUT /crawlings/1.json
  def update
    respond_to do |format|
      if @crawling.update(crawling_params)
        format.html { redirect_to @crawling, notice: 'Crawling was successfully updated.' }
        format.json { render :show, status: :ok, location: @crawling }
      else
        format.html { render :edit }
        format.json { render json: @crawling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawlings/1
  # DELETE /crawlings/1.json
  def destroy
    @crawling.destroy
    respond_to do |format|
      format.html { redirect_to crawlings_url, notice: 'Crawling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawling
      @crawling = Crawling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawling_params
      params.fetch(:crawling, {})
    end
end
