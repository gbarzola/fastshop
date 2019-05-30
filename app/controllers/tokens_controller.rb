class TokensController < ApplicationController


  def index
    @tokens = Token.all
  end

  def show
  end

  def new
    @token = Token.new
  end

  def edit
  end

  def create
    @token = UnidadesMinera.new(tokens_params)

    respond_to do |format|
      if @token.save
        format.html { redirect_to @token, notice: 'Token was successfully created.' }
        format.json { render :show, status: :created, location: @token }
      else
        format.html { render :new }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @token.update(tokens_params)
        format.html { redirect_to @token, notice: 'Token was successfully updated.' }
        format.json { render :show, status: :ok, location: @token }
      else
        format.html { render :edit }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @token.destroy
    respond_to do |format|
      format.html { redirect_to tokens_url, notice: 'Token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_token
      @token = Token.find(params[:id])
    end

    def tokens_params
      params.require(:token).permit(:imagen)
    end
end
end
