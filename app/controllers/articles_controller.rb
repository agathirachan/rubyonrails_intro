class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # byebug
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show

    # currently populated in action helper
    # article variable is only accessible in the show method
    # article = Article.find(parms[:id])
    
    # @article is now an instance variable 
    # @article = Article.find(parms[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    # multi line comment
    # respond_to do |format|
    # if @article.save
    #   format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #   format.json { render :show, status: :created, location: @article }
    # else
    #   format.html { render :new }
    #   format.json { render json: @article.errors, status: :unprocessable_entity }
    #  end
    # end 
    # Work around for now to be deleted
    @article.user = User.first
    # render plain: article_params.inspect
    if @article.save
        flash[:notice] ="Article was created successfully."
        # article is the prefix to articles#show so article_path is used
        redirect_to article_path(@article)
        #redirect_to @article # shortcut for top command

    else
      render "new"
    end
     
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
   # respond_to do |format|
   #   if @article.update(article_params)
   #     format.html { redirect_to @article, notice: 'Article was successfully updated.' }
   #     format.json { render :show, status: :ok, location: @article }
   #   else
   #     format.html { render :edit }
   #     format.json { render json: @article.errors, status: :unprocessable_entity }
   #   end
   # end
   if @article.update(article_params)
       flash[:notice] ="Article was updated successfully."
       # article is the prefix to articles#show so article_path is used i.e shortcut to article_path(@article)
       redirect_to @article
   else
      render 'edit'
   end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    #respond_to do |format|
    #  format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    # format.json { head :no_content }
    # end
    redirect_to articles_path
  end
  
  # anything below private is a private method
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      # byebug
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
