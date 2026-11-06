import java.util.ArrayList;

public class Exercicio2 {
    public static void main(String[] args) {
        ItemDoCardapio curry = new ItemDoCardapio("Curry", 30.0);
        ItemDoCardapio cafe = new ItemDoCardapio("Cafe", 15.0);
        ComboLeblanc combo = new ComboLeblanc("Curry + Cafe", 40.0);

        CafeLeblanc leblanc = new CafeLeblanc();
        leblanc.adicionar(curry);
        leblanc.adicionar(cafe);
        leblanc.adicionar(combo);
        leblanc.mostrarCardapio();
    }
}

class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio item : cardapio) {
            System.out.println(item.getNome() + " - R$ " + item.precoFinal());
        }
    }
}
