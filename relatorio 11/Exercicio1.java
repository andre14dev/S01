public class Exercicio1 {
    public static void main(String[] args) {
        Morador mago = new Mago("Howl", "Transformacao");
        Morador demonio = new DemonioDoFogo("Calcifer");

        mago.apresentar();
        demonio.apresentar();

        // Morador morador = new Morador("Sophie");
    }
}

abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Mago " + getNome() + " lanca o feitico " + feitico + ".");
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Demonio do fogo " + getNome() + " faz o castelo andar.");
    }
}
