import java.io.EOFException;
import java.io.RandomAccessFile;

public class Arquivo {

  RandomAccessFile arq;
  String nomeArquivo = "";

  public Arquivo(String na) throws Exception {
    this.nomeArquivo = na;
    arq = new RandomAccessFile(na, "rw");
    if (arq.length() < 4) {
      arq.seek(0);
      arq.writeInt(0);
    }
  }

  public int create(Livro obj) throws Exception {
    arq.seek(0);
    int ultimoID = arq.readInt();
    ultimoID++;
    arq.seek(0);
    arq.writeInt(ultimoID);
    obj.setID(ultimoID);

    arq.seek(arq.length());
    long endereco = arq.getFilePointer();
    byte[] ba = obj.toByteArray();
    short tam = (short) ba.length;
    arq.write(' '); // lápide
    arq.writeShort(tam);
    arq.write(ba);

    return obj.getID();
  }

  public Livro read(int id) throws Exception{
    //busca sequencial do livro com o id passado como parametro
    arq.seek(0);
    while(arq.getFilePointer() < arq.length()){
        short tam;
        try {
            tam = arq.readShort(); // lê o tamanho do registro
        } catch (EOFException e) {
            break; // fim do arquivo, não há mais registros para ler
        }
      byte[] ba = new byte[tam]; //cria um vetor de bytes do tamanho do registro p ser lido
      arq.read(ba); //le o registro

      if (ba.length > 0 && ba[0] != '*'){ //se o registro lido nao for uma lapide (e se ele nao estiver vazio)
        Livro l = new Livro(); //cria um novo objeto de livro 
        l.fromByteArray(ba); //transforma o vetor de bytes em um objeto de livro
        if (l.getID() == id){ //se o id do livro lido for igual ao id passado como parametro p ser encontrado, 
          return l; //retorna o livro
        }
      }
  
    }
    return null; //se nao encontrar o livro, retorna null
  }

  public void close() throws Exception {
    arq.close();
  }
}
