#include <iostream>
using namespace std;

// Calcula a confiabilidade de um sistema em série: produto das probabilidades
float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0f;
    for (int i = 0; i < tamanho; i++) {
        confiabilidade *= probabilidades[i];
    }
    return confiabilidade;
}

int main() {
    int n;
    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    float probabilidades[n];

    for (int i = 0; i < n; i++) {
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    float resultado = calcular_confiabilidade_sistema(probabilidades, n);

    cout << "Confiabilidade total do sistema: " << resultado
         << " (" << resultado * 100 << "%)" << endl;

    return 0;
}
