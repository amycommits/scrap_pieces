class SavedSearchesController < ApplicationController
  before_action :set_saved_search, only: [:show, :edit, :update, :destroy]

  # GET /saved_searches
  # GET /saved_searches.json
  def index
    @saved_searches = SavedSearch.all
    if @saved_searches.nil?
       @saved_searches = current_user.saved_searches.build
    end
  end

  # GET /saved_searches/1
  # GET /saved_searches/1.json
  def show
  end

  # GET /saved_searches/new
  def new
   # @saved_search = SavedSearch.new
   # @ss = @saved_search.build(saved_search_params)
  # @saved_search = current_user.build_saved_search
    @saved_search = current_user.saved_searches.build
   
  end

  # GET /saved_searches/1/edit
  def edit
  end

  # POST /saved_searches
  # POST /saved_searches.json
  def create
  #  @saved_search = SavedSearch.new(saved_search_params)
   #@saved_search = SavedSearch.create(saved_search_params)
   @saved_search = current_user.saved_searches.build(saved_search_params)
  
    respond_to do |format|
      if @saved_search.save
        format.html { redirect_to @saved_search, notice: 'Saved search was successfully created.' }
        format.json { render :show, status: :created, location: @saved_search }
        format.js
      else
        format.html { render :new }
        format.json { render json: @saved_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_searches/1
  # PATCH/PUT /saved_searches/1.json
  def update
    respond_to do |format|
      if @saved_search.update(saved_search_params)
        format.html { redirect_to @saved_search, notice: 'Saved search was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_search }
      else
        format.html { render :edit }
        format.json { render json: @saved_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_searches/1
  # DELETE /saved_searches/1.json
  def destroy
    @saved_search.destroy
    respond_to do |format|
      format.html { redirect_to saved_searches_url, notice: 'Saved search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_search
      @saved_search = SavedSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_search_params
      params.require(:saved_search).permit(:name, :user_id, :description, :params, :searched_index)
    end
end
