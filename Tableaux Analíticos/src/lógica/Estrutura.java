package lógica;

import java.util.ArrayList;
import java.util.NoSuchElementException;

/**
 *
 * @author Rebeca
 */
public class Estrutura {

    No primeiro; //raiz
    No ultimo;
    int tam;
    ArrayList<No> c = new ArrayList<No>();
    
    public Estrutura() {
        this.primeiro = new No();
        this.ultimo = primeiro;
    }

    public void adicionar(String[] a, boolean[] x) {
        for (int i = 0; i < a.length; i++) {
            ultimo.prox = new No();
            ultimo = ultimo.prox;
            ultimo.conteudo = a[i];
            ultimo.valor = x[i];
            ultimo.prox = null;
            c.add(ultimo);
           
            tam++;
        }
    }
    
    public ArrayList<No> get(){
        return c;
    }
    public void imprimir() {
        No aux = new No();
        aux = primeiro;
        while (aux.prox != null) {
            System.out.println(aux.prox.conteudo);

            aux = aux.prox;
        }
        System.out.println("===========Fim de exibição=========");

    }

    private void buscaProfundidade(String conteudo,boolean valor) {
        PilhaEncadeada pilha = new PilhaEncadeada();
        No aux;
        pilha.push(primeiro);
        while (!pilha.isEmpty()) {
            aux = (No) pilha.pop();
            if (aux.conteudo.equals(conteudo)&& aux.valor!=valor) {
                aux.cor=1;
            } else if (aux.filhoEsquerda != null) {
                pilha.push(aux.filhoEsquerda);
            } else if (aux.filhoDireita != null) {
                pilha.push(aux.filhoDireita);
            }
        }
        
    }

    public void expandir(ArrayList<No> n) {
        boolean[] mar = new boolean[2];
        String simbolo;
        for (No aux : n) {
            // laço de repetição com base na busca em profundidade
            if (aux.conteudo.contains("->") && aux.valor == true && aux.cor!=1) {
                simbolo="->";
                mar[0]=false;
                mar[1]=true;
                expansaoBeta(aux,simbolo,mar,n);
            } else if (aux.conteudo.contains("^") && aux.valor == false&& aux.cor!=1) {
                simbolo="^";
                mar[0]=false;
                mar[1]=false;
                expansaoBeta(aux,simbolo,mar,n);
            } else if (aux.conteudo.contains("v") && aux.valor == true&& aux.cor!=1) {
                simbolo="v";
                mar[0]=true;
                mar[1]=true;
                expansaoBeta(aux,simbolo,mar,n);
            } else if (aux.conteudo.contains("!") && aux.valor == false&& aux.cor!=1) {
                aux.valor = true;
                eliminar("!");
                //add((String[])aux.conteudo, true);
            } else if (aux.conteudo.contains("^") && aux.valor == true&& aux.cor!=1) {
                simbolo = "^";
                mar[0] = true;
                mar[1] = true;
                expansaoAlfa(aux, simbolo, mar,n);
            } else if (aux.conteudo.contains("v") && aux.valor == false&& aux.cor!=1) {
                simbolo = "v";
                mar[0]=false;
                mar[1]=false;
                expansaoAlfa(aux,simbolo,mar,n);
            }else if(aux.conteudo.contains("->") && aux.valor==false&& aux.cor!=1){
                simbolo="->";
                mar[0]=true;
                mar[1]=false;
                expansaoAlfa(aux,simbolo,mar,n);
            }
            else{
                System.out.println("A expressão dada é uma tautologia");
                break;
            }

        }
    }

    public void expansaoBeta(No aux, String simbolo, boolean[]mar,ArrayList<No> n) {
        for(int i=0;i<n.size();i++){
        this.buscaProfundidade(n.get(i).conteudo,n.get(i).valor);
        }
        String []t;
        t=aux.conteudo.split(simbolo);
        No l = new No();
        l.conteudo=t[0];
        l.valor=mar[0];
        inserirEsquerda(aux,l,t);
        No r = new No();
        r.conteudo=t[1];
        r.valor=mar[1];
        inserirDireita(aux,r);
    }
    
  
     private void inserirEsquerda(No subArv, No no,String[]t) {
        if (subArv.filhoEsquerda!= null) {
            throw new NoSuchElementException();
        } else {
            subArv.filhoEsquerda=no;

        }
    }

    private void inserirDireita(No subArv, No no) {
        if (subArv.filhoDireita!= null) {
            throw new NoSuchElementException();
        } else {
            subArv.filhoDireita=no;

        }
    }
    
    private void eliminar(String t) {
        t=null;
    }

    public void expansaoAlfa(No aux, String simbolo, boolean[] mar,ArrayList<No> n) {
        for(int i=0;i<n.size();i++){
            for(int j=i+1;j<n.size();j++){
                if(n.get(j).conteudo.equals(n.get(j).conteudo) &&n.get(i).valor!= n.get(j).valor){
                    n.get(j).cor=1;
                }
                String[] r;
                r = aux.conteudo.split(simbolo);
                adicionar(r, mar);
            }
        }
    }
    
    public void show() {
        if (this.primeiro == null) {
            System.out.println("Arvore vazia");
        } else {
            //System.out.println("O elemento do meio é a raiz!!");
            prefixa(this.primeiro);
        }
    }

    private void prefixa(No no) {
        if (no != null) {
            prefixa(no.filhoEsquerda);
            System.out.println("");
            System.out.print(no.conteudo + ",");
            prefixa(no.filhoDireita);
        }
    }
    
    
}

