import java.io.IOException;
import java.util.Scanner;


class aq02scan {
    public static int maiusculo(String palavra, int x, int num){
        if(Character.isUpperCase(palavra.charAt(x)) == true){
            num++;
        }
        if(x >= palavra.length()-1){
            return num;
        }
        return maiusculo(palavra, x+1, num);
    }

    public static void main (String args[]) throws IOException {
        String p = "";
        Scanner ler = new Scanner(System.in);
        while ((p = ler.nextLine()) != null && !p.equals("FIM")) {
            int num = maiusculo(p, 0, 0);
            System.out.println(num);                
            
        }
        ler.close();
      
    } 

}