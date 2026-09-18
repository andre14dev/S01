#include <iostream>
using namespace std;

int main() {
    float capacidadeMaxima;
    float cargaAtual = 0.0f;
    int opcao;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidadeMaxima;

    do {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;
        cout << endl;

        switch (opcao) {
            case 1: {
                cout << "Carga Atual: " << cargaAtual << " kg / "
                     << capacidadeMaxima << " kg" << endl;
                cout << "Espaco Disponivel: " << (capacidadeMaxima - cargaAtual)
                     << " kg" << endl;
                break;
            }
            case 2: {
                float peso;
                cout << "Digite o peso do pacote a ser carregado (kg): ";
                cin >> peso;

                if (cargaAtual + peso > capacidadeMaxima) {
                    cout << "Alerta: Peso maximo de decolagem excedido! "
                         << "Operacao cancelada." << endl;
                } else {
                    cargaAtual += peso;
                    cout << "Pacote adicionado com sucesso!" << endl;
                }
                break;
            }
            case 3: {
                float peso;
                cout << "Digite o peso a ser descarregado (kg): ";
                cin >> peso;

                if (peso > cargaAtual) {
                    cout << "Alerta: Nao e possivel remover mais peso do que "
                         << "o carregado! Operacao cancelada." << endl;
                } else {
                    cargaAtual -= peso;
                    cout << "Pacote removido com sucesso!" << endl;
                }
                break;
            }
            case 4: {
                cout << "Encerrando sistema de telemetria..." << endl;
                break;
            }
            default: {
                cout << "Opcao invalida!" << endl;
                break;
            }
        }

    } while (opcao != 4);

    return 0;
}
