#include <iostream>
#include <string>
using namespace std;

class MembroInatel {
protected:
    string nome;

public:
    MembroInatel(string n) : nome(n) {}

    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }

    virtual ~MembroInatel() {}
};

class Aluno : public MembroInatel {
private:
    string curso;

public:
    Aluno(string n, string c) : MembroInatel(n), curso(c) {}

    void seApresentar() override {
        cout << "Meu nome é " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
private:
    string disciplina;

public:
    Professor(string n, string d) : MembroInatel(n), disciplina(d) {}

    void seApresentar() override {
        cout << "Meu nome é " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    Aluno aluno("André", "Engenharia de Software");
    Professor professor("Marcelo", "Linguagens de Programação");

    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}
