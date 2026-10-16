class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usa uma suprema.")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} ativa o escudo gigante.")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} fortalece os aliados.")

    def curar_equipe(self):
        print(f"{self.codinome} cura a equipe.")


if __name__ == "__main__":
    herois: list[HeroiOverwatch] = [
        HeroiOverwatch("Tracer", "Dano"),
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
    ]

    for heroi in herois:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
