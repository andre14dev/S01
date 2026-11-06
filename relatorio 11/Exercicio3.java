import java.util.HashMap;

public class Exercicio3 {
    public static void main(String[] args) {
        Alienigena alien = new Alienigena("Serpo");
        EspiritoYoukai youkai = new EspiritoYoukai("Turbo Vovo");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Tunel abandonado", alien);
        mapa.registrar("Casa antiga", youkai);

        mapa.investigar("Tunel abandonado");
        mapa.investigar("Casa antiga");
        mapa.investigar("Praca central");
    }
}

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " surge e sequestra tudo o que estiver por perto.");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " aparece e assombra o local.");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println(local + " esta tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}
