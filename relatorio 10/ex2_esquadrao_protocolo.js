class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(`${this.codinome} deve implementar usarHabilidade()`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} | Pistola: ${this.#pistola.modelo} | ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Lança uma cortina de fumaça.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Revela a posição dos inimigos.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avança e elimina os inimigos.';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`Esquadrão ${this.nome}`);
        this.#agentes.forEach(a => a.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(a => a instanceof Controlador);
    }
}

const brimstone = new Controlador('Brimstone', 'Sheriff');
const omen = new Controlador('Omen', 'Ghost');
const sova = new Iniciador('Sova', 'Classic');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alfa', [brimstone, omen, sova, jett]);
esquadrao.iniciarPartida();

esquadrao.listarControladores().forEach(c => console.log(c.codinome));

const generico = new AgenteProtocolo('Genérico', 'Shorty');
// generico.entrarEmCombate();
