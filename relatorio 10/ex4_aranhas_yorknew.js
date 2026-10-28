class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} ataca ${alvo.nome} com aura.`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} reforça o punho com aura e acerta ${alvo.nome}.`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma a aura em eletricidade e atinge ${alvo.nome}.`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} prende ${alvo.nome} com correntes de aura.`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`Trupe Fantasma em ${this.cidade}`);
        this.#aranhas.forEach(a => console.log(`${a.numero} - ${a.nome}`));
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}

const chrollo = new Aranha('Chrollo', 0);
const feitan = new Aranha('Feitan', 2);

const trupe = new TrupeFantasma('Yorknew', [chrollo, feitan]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(2);

const usuarios = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

usuarios.forEach(u => u.atacar(alvo));
