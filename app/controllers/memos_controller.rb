class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end
  

  def show
    @memo = Memo.find(params[:id])
  end
  

  def new
    @memo = Memo.new
  end
  

  def create
    @memo = Memo.new(memo_params)
  
    if @memo.save
      redirect_to @memo, notice: 'Memo was successfully created.'
    else
      render :new
    end
  end
  

  def edit
    @memo = Memo.find(params[:id])
  end
  

  def update
    @memo = Memo.find(params[:id])
  
    if @memo.update(memo_params)
      redirect_to @memo, notice: 'Memo was successfully updated.'
    else
      render :edit
    end
  end
  

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
  
    redirect_to memos_url, notice: 'Memo was successfully destroyed.'
  end

  private

def memo_params
  params.require(:memo).permit(:title, :content)
end

  
end
