import java.util.Scanner;

class ex3_lp {
    public static void main(String args[]) {
        Scanner ler = new Scanner(System.in);

        System.out.println("Digite números positivos a serem contabilizados e digite um negativo para finalizar:");

        int x, nums_positivos = 0;
        while ((x = ler.nextInt()) > 0) {
            nums_positivos++;
        }
        System.out.println("A quantidade digitada de números positivos é:" + nums_positivos);

    }
}
