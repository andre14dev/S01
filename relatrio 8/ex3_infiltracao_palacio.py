class Persona:
    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona: {self.nome} | Arcano: {self.arcano}")


class Aliado:
    def __init__(self, nome, codinome):
        self.nome = nome
        self.codinome = codinome


class Lider:
    def __init__(self, codinome):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)

    def infiltrar(self, palacio):
        print(f"Palácio de {palacio} invadido por {self.codinome}.")
        self.persona.invocar()
        for aliado in self._equipe:
            print(f"Equipe: {aliado.codinome} ({aliado.nome})")


if __name__ == "__main__":
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")
    joker.recrutar(ryuji)
    joker.recrutar(ann)
    joker.infiltrar("Kamoshida")

    # Composição: a Persona é criada dentro do __init__ do Lider e só existe
    # enquanto o Lider existir.
    # Agregação: os Aliados são criados fora e o Lider só guarda a referência,
    # então continuam existindo sem ele.
