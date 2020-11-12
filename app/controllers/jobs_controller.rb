class JobsController < ApplicationController
  before_action :authenticate_user!, except: :show #この一行を追加

  def index
  end
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params) #job_paramsの値が入ったオブジェクトを作成する（job_paramsは次で定義します）
    if @job.save #もし求人が保存できたら
        flash[:notice] = "求人が保存されました" #フラッシュメッセージを出す
        redirect_to @job #作成された求人の詳細ページへリダイレクト
    else
        flash[:alert] = "募集作成に失敗しました" #フラッシュメッセージを出す
    end
 end

  def show
    @job = Job.find(params[:id])

  end

  private

  def job_params
    params.require(:job).permit(:title, :content).merge(user_id: current_user.id)
  end


end
