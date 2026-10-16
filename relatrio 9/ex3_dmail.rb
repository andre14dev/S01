class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: #{mensagem}"
    puts "Mensagem enviada para o passado."
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero}: #{membro.nome}"
  end

  def experimento(mensagem)
    @membros.each do |m|
      puts "Presente: Lab Mem #{m.numero} - #{m.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new(1, "Rintaro Okabe")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)
lab.experimento("O Dr. Pepper está na geladeira.")

# Composição: o PhoneWave é criado dentro do initialize do laboratório e só
# existe nele.
# Agregação: os membros são criados fora e o laboratório só guarda a
# referência, então continuam existindo sem ele.
