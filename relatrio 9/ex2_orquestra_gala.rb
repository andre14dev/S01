class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "#{self.class} deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome} toca #{instrumento} em #{peca} e conduz a melodia principal."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome} toca #{instrumento} em #{peca} e acompanha o ritmo do solista."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "Regente #{@nome} - peça: #{peca}"
    @orquestra.each do |i|
      i.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map { |i| "#{i.class}: #{i.nome}" }
  end
end

kousei = Solista.new("Kousei Arima", "piano")
kaori = Acompanhador.new("Kaori Miyazono", "violino")
regente = Regente.new("Seto")

regente.convocar(kousei)
regente.convocar(kaori)
regente.reger("Liebesleid")

regente.escalacao.each do |linha|
  puts linha
end

generico = Instrumentista.new("Anônimo", "flauta")
# generico.interpretar("Liebesleid")
