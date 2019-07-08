class CalcularWorker
  include Sidekiq::Worker

  def perform(processamento_id)
    puts "Iniciando o calculo"
    ExecutaProcessamentoService.new(processamento_id).executar
    puts "Finalizado o calculo"
  end
end
