#include <iostream>
#include <string>
using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << "A banda " << nome << " sobe ao palco e desafia " << rival.nome << "!" << endl;
        rival.energia -= static_cast<int>(potenciaSom);
    }

    void exibirStatus() {
        cout << "Banda: " << nome
             << " | Integrantes: " << integrantes
             << " | Potencia: " << potenciaSom
             << " | Energia: " << energia << endl;
    }
};

int main() {
    Banda banda1;
    banda1.nome = "Os Compiladores";
    banda1.integrantes = 4;
    banda1.potenciaSom = 35.5;
    banda1.energia = 100;

    Banda banda2;
    banda2.nome = "Segmentation Fault";
    banda2.integrantes = 5;
    banda2.potenciaSom = 28.0;
    banda2.energia = 100;

    cout << "=== Antes do duelo ===" << endl;
    banda1.exibirStatus();
    banda2.exibirStatus();

    cout << endl << "=== Duelo ===" << endl;
    banda1.duelar(banda2);

    cout << endl << "=== Depois do duelo ===" << endl;
    banda1.exibirStatus();
    banda2.exibirStatus();

    return 0;
}
