require 'csv'
class ExecutaProcessamentoService
  include ActiveModel::Model

  attr_accessor :processamento

  def initialize(processamento_id)
    @processamento = Processamento.find(processamento_id)
  end

  def executar
    ActiveRecord::Base.transaction do
      persiste_csv
      caminho_resultado = "Calculador::#{processamento.tipo}Strategy".constantize.calcular(processamento.dado)
      processamento.dado.arquivo.purge
      processamento.dado.arquivo.attach(io: File.open(caminho_resultado), filename: caminho_resultado.split('/').last)
      processamento.status = :finalizado
      processamento.save
      raise ActiveRecord::Rollback unless caminho_resultado && processamento.errors.empty?
    end
    processamento.errors.any?
  end

  private

  def persiste_csv
    arquivo_a_processar = CSV.new(processamento.dado.arquivo.download, headers: true)
    arquivo_a_processar.each do |linha|
      processamento.dado.registros.create(matricula: linha['MATRICULA'], nota: linha['NOTA'].to_i, ch: linha['CH'].to_i)
    end
  end
end