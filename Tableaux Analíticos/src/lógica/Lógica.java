package lógica;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.NoSuchElementException;
import lógica.Estrutura;


public class Lógica {

    public static void main(String[] args) {
        StopWatch w = new StopWatch();
        Scanner t = new Scanner(System.in);
        String b,d,a;
        b=t.nextLine();
        d=t.nextLine();
        a=t.nextLine();
       
        w.start();
        ArrayList<String> u =new ArrayList<String> (){
            {add(b); add(a);}
        };
        Estrutura e = new Estrutura();
        
        if(b!=null){
            String[]s;
            s=b.split(",");
      
        boolean[] mar = new boolean[s.length];
        for(int i=0;i<s.length;i++){
            mar[i]=true;
        }
        e.adicionar(s,mar);
        //e.imprimir();
        }
        if(a==null){
            throw new NoSuchElementException();
        }else{
        String[]k;
        k=a.split(",");
        boolean[] mr = new boolean[k.length];
        for(int i=0;i<k.length;i++){
            mr[i]=false;
        }
        e.adicionar(k,mr);
        }
        
        e.expandir(e.get());
        e.show();
   
        w.stop();
      
    }
}

