class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} - perigo ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`Diário ${this.numero}`);
        this.#fichas.forEach(f => console.log(f.descrever()));
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`Cabana do Mistério, dono: ${this.dono}`);
        this.#funcionarios.forEach(f => console.log(`${f.nome} - ${f.cargo}`));
    }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 3);
diario.anotar('Gobbleweirdes', 4);
diario.anotar('Zumbis', 2);
diario.exibirFichas();

const soos = new Funcionario('Soos', 'Faz-tudo');
const wendy = new Funcionario('Wendy', 'Caixa');

const cabana = new CabanaDoMisterio('Stan');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();

// Composição: as FichaDeCriatura são criadas dentro do método anotar() do
// DiarioMisterioso e só existem nele.
// Agregação: os Funcionarios são criados fora e a Cabana só guarda a
// referência, então continuam existindo sem ela.
