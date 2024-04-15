import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;


class aq02 {
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
        BufferedReader arq = new BufferedReader(new FileReader("pub.in.txt"));
        BufferedWriter arqout = new BufferedWriter(new FileWriter("pub.out.txt"));
  
        while ((p = arq.readLine()) != null ) {
            int num = maiusculo(p, 0, 0);
            
            if(!p.equals("FIM")){
                System.out.println(num);
                arqout.append(num + "\n");
                
            }

        }
        arq.close(); 
        arqout.close();
      
    } 

}