import java.io.RandomAccessFile;

class codigo{
    public static void main(String[] args) {
        
        int A = -1;
        int B = -1;
        char op = ' ';
        char X = 'X';
        char Y = 'Y';
        char W = 'W';
        String instrucao;

        String A0 = "nB";
        String A1 = "nAeBn";
        String A2 = "nAeB";
        String A3 = "Lzero";
        String A4 = "AeBn";
        String A5 = "nA";
        String A6 = "AxB";
        String A7 = "AenB";
        String A8 = "nAonB";
        String A9 = "nAxnB";
        String AA = "Bcopia";
        String AB = "AeB";
        String AC = "Lum";
        String AD = "AonB";
        String AE = "AoB";
        String AF = "Acopia";



        try{
            RandomAccessFile arq = new RandomAccessFile("testeula.ula", "rw");
            RandomAccessFile arq2 = new RandomAccessFile("testeula.hex", "rw");
            instrucao = arq.readLine();
            instrucao = arq.readLine();
            while (instrucao!= null && !(arq.getFilePointer()<arq.length() && instrucao.equals("fim."))){
                //System.out.println(instrucao);
                if (instrucao.charAt(0) == X){
                    A = instrucao.charAt(2);
                }else if(instrucao.charAt(0)== Y){
                    B = instrucao.charAt(2);
                }
                if(instrucao.charAt(0) == W){
                    String []v1 = instrucao.split("=");
                    String parte1 = v1[1];
                    String []v2 = parte1.split(";");
                    String resp = v2[0];

                    if (resp.compareTo(A0)==0){
                        op = '0';
                    }else if(resp.compareTo(A1)==0){
                        op = '1';
                    }else if(resp.compareTo(A2)==0){
                        op = '2';
                    }else if(resp.compareTo(A3)==0){
                        op = '3';
                    }else if (resp.compareTo(A4)==0){
                        op = '4';
                    }else if (resp.compareTo(A5)==0){
                        op = '5';
                    }else if(resp.compareTo(A6)==0){
                        op = '6';
                    }else if(resp.compareTo(A7)==0){
                        op = '7';
                    }else if(resp.compareTo(A8)==0){
                        op = '8';
                    }else if(resp.compareTo(A9)==0){
                        op = '9';
                    }else if (resp.compareTo(AA)==0){
                        op = 'A';
                    }else if (resp.compareTo(AB)==0){
                        op = 'B';
                    }else if(resp.compareTo(AC)==0){
                        op = 'C';
                    }else if(resp.compareTo(AD)==0){
                        op = 'D';
                    }else if (resp.compareTo(AE)==0){
                        op = 'E';
                        
                    }else if (resp.compareTo(AF)==0){
                        op = 'F';
                    }
                }
                if (op != ' '){
                    arq2.write(A);
                    arq2.write(B);
                    if (op == 'A' || op == 'B' || op == 'C' || op == 'D' || op == 'E' || op == 'F'){
                        arq2.write(op);
                        arq2.writeByte('\n');
                    }else if (!(op == 'A' || op == 'B' || op == 'C' || op == 'D' || op == 'E' || op == 'F')){
                        arq2.write(op);
                        arq2.writeByte('\n');
                    }

                    op = ' ';
                }
                instrucao = arq.readLine();
            }
        arq.close();
        arq2.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        


    }
}