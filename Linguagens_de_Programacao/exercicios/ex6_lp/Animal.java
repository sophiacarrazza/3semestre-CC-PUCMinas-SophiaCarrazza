
public class Animal implements SerVivo {
    // atributos
    private String tipo;
    private int idade;

    // construtor
    public Animal(String tipo, int idade) {
        this.tipo = tipo;
        this.idade = idade;
    }

    // getters e setters
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    // print
    public void printAnimal() {
        System.out.println("Tipo: " + tipo);
        System.out.println("Idade: " + idade + " anos");
    }

    // animal faz um som
    public void fazSom() {
        System.out.println("O " + tipo + " está fazendo um som.");
    }
}
