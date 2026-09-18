#include <iostream>
using namespace std;

// Função recursiva que calcula o número de cenários de confrontos possíveis
int combinar_equipes(int n) {
    if (n == 0) return 0;               // Ponto de parada 1
    if (n == 1) return 1;               // Ponto de parada 2 (cenário base)
    return combinar_equipes(n - 1) + combinar_equipes(n - 2); // Chamada recursiva
}

int main() {
    int n;
    cout << "Digite o tamanho do chaveamento (n): ";
    cin >> n;

    cout << "Total de cenarios de confrontos possiveis: "
         << combinar_equipes(n) << endl;

    return 0;
}
