class ProcessamentosController < ApplicationController
  before_action :set_processamento, only: [:show, :destroy]


  def show
  end

  def new
    @processamento = Processamento.new
    @processamento.build_dado
  end

  def create
    @processamento = Processamento.new(processamento_params)
    if @processamento.save
      @processamento.jid = CalcularWorker.perform_async(@processamento.id)
      @processamento.save
      redirect_to processamento_path(@processamento)
    else
      redirect_to root_path
    end
  end

  def destroy
    # Sidekiq::Queue.new.find_job(@processamento.jid).delete
    @processamento.update_attributes(status: :cancelado)
    redirect_to processamento_path(@processamento)
  end

  private

  def processamento_params
    params.require(:processamento).permit(:tipo, dado_attributes: [:arquivo])
  end

  def set_processamento
    @processamento = Processamento.find(params[:id])
  end
end
