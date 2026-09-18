#include <iostream>
using namespace std;

int main() {
    int matriz_solar[5][5];
    int opcao;

    // Inicializa todas as células como inativas (0)
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            matriz_solar[i][j] = 0;
        }
    }

    do {
        cout << "\n=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;
        cout << endl;

        switch (opcao) {
            case 1: {
                int f, c;
                cout << "Digite a fileira (0-4): ";
                cin >> f;
                cout << "Digite a coluna (0-4): ";
                cin >> c;

                if (f < 0 || f > 4 || c < 0 || c > 4) {
                    cout << "Erro: posicao invalida!" << endl;
                } else if (matriz_solar[f][c] == 0) {
                    matriz_solar[f][c] = 1;
                    cout << "Sucesso: Celula solar ativada!" << endl;
                } else {
                    cout << "Erro: Celula solar ja esta em operacao!" << endl;
                }
                break;
            }
            case 2: {
                cout << "--- Mapa da Matriz Solar ---" << endl;
                for (int i = 0; i < 5; i++) {
                    for (int j = 0; j < 5; j++) {
                        cout << "[" << matriz_solar[i][j] << "] ";
                    }
                    cout << endl;
                }
                break;
            }
            case 3: {
                int ativas = 0, inativas = 0;

                for (int i = 0; i < 5; i++) {
                    for (int j = 0; j < 5; j++) {
                        if (matriz_solar[i][j] == 1) {
                            ativas++;
                        } else {
                            inativas++;
                        }
                    }
                }

                float percentual = (ativas / 25.0f) * 100;

                cout << "=== RELATORIO FINAL DE OPERACAO ===" << endl;
                cout << "Total de celulas ATIVAS: " << ativas << endl;
                cout << "Total de celulas INATIVAS: " << inativas << endl;
                cout << "Capacidade Operacional: " << percentual << "%" << endl;
                break;
            }
            default: {
                cout << "Opcao invalida!" << endl;
                break;
            }
        }

    } while (opcao != 3);

    return 0;
}
