import java.util.Scanner;

class ex_04_arduino {
    public static void main(String[] args) {

    Scanner sc = new Scanner(System.in);
    String linha = sc.readLine();
    String [] vetor = new String[100];
    int count = 4;

    int i=3;
    int f=0;
    while(linha.charAt(i) != null){ //corrigir isso
        
        for(int a=0; a<2;a++){
             vetor[count] = linha.charAt(a+f);

        }
        
        i++;
    }

    
    }
}