require 'csv'
module Calculador

  class CHStrategy
    def self.calcular(dado)
      resultado = CSV.open("storage/resultado#{dado.id}.csv", 'w+',
                           { write_headers: true, headers: ['matricula', 'ch_total'] })
      dado.registros.group(:matricula).sum(:ch).each do |linha|
        resultado << linha
      end
      resultado.close
      resultado.path
    end
  end

  class CRStrategy
    def self.calcular(dado)
      resultado = CSV.open("storage/resultado#{dado.id}.csv", 'w+',
                           { write_headers: true, headers: ['matricula', 'cr'] })
      dado.registros.group(:matricula).pluck('matricula, (sum(nota*ch)/sum(ch)) as cr').each do |linha|
        resultado << linha
      end
      resultado.close
      resultado.path
    end
  end

end