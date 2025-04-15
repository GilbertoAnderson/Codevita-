//Codevita 2023
//Cisterna d'água
//Evandro José Graton

import java.util.Scanner;
import java.time.*;
import java.time.format.*;

public class WaterCistern {

    private int r =0, h = 0, s = 0, d = 0, g = 0;
    private Scanner sc = new Scanner(System.in);

    public static void main (String[] args) {
        new WaterCistern().execute();
    }

    public void execute() {
        //Realiza a obtenção e validação das variável
        entrada_rhs();
        entrada_dg();

        //Registra o inicio do calculo
        ZonedDateTime t0 = ZonedDateTime.now();

        double menorDistancia = (d < 0)
            ? caminhoPeloTopo()    //Se o destino estiver na superficie plana do topo, retorna o trajeto mais curto entre ir pela superficie curva ou ir pelo topo 
            : caminhoCurvo (d, g); //Se o destino estiver na superifice curva, o trajeto mais curto será sempre pela superficie curva

        System.out.printf("Saida\n\r%d\n\r\n\r", Math.round(menorDistancia));

        //Calcula o tempo de processamento entre t0 e agora e apresenta em fracao de segundos
        System.out.println("Processamento (s): " + Duration.between(t0, ZonedDateTime.now()).toMillis()/1000.0);
    }  

    private void entrada_rhs() {
        String[] valores;
        String restricoes = "";

        do {
            System.out.println("Entrata");
            valores = sc.nextLine().split(",");
            restricoes = "";

            try {
                r = Integer.parseInt(valores[0]);
                h = Integer.parseInt(valores[1]);
                s = Integer.parseInt(valores[2]);

                restricoes = validarRaioAlturaOrigem();
            } catch(Exception ex) {
                restricoes = "\n\rTodos os valores informados devem ser inteiros positivos separados por ,\n\r" + ex + "\n\r";
            }

            if(restricoes != "") {
                System.out.println(restricoes);
            }
        } while(restricoes.length() > 0);
    }

    private void entrada_dg() {
        String[] valores;
        String restricoes = "";

        do {
            valores = sc.nextLine().split(",");
            restricoes = "";

            try {
                d = Integer.parseInt(valores[0]);
                g = Integer.parseInt(valores[1]);

                restricoes = validarDestinoAngulo();
            } catch(Exception ex) {
                restricoes = "\n\rTodos os valores informados devem ser inteiros separados por ,\n\r" + ex + "\n\r";
            }

            if (restricoes != "") {
                System.out.println(restricoes);
            }
        } while(restricoes.length() > 0);

        //Reduz angulos maiores que 180 para quadrante 0-180
        g = g > 180 ? 360-g : g;
    }
    
   private String validarRaioAlturaOrigem() {
        String restricoes = s > 40 ? "" : "Origem precisa ser maior que 40\n\r";

        restricoes += h <= 40
            ? "Altura precisa ser maior que 40\n\r"
            : h < 10000
                ? ""
                : "Altura precisa ser menor que 10000\n\r";

        restricoes += s < h
            ? ""
            : "Origem precisa ser menor ou igual a altura\n\r";

        restricoes += r < 0
            ? "Raio nao pode ser valor negativo\n\r"
            : r <= 100 
                ? "" 
                : "Ralo precisa ser menor que 100\n\r";
        
        return restricoes;
    }

     private String validarDestinoAngulo() {
        String restricoes = (g >= 0) && (g <= 359)
            ? ""
            : "Angulo precisa ser entre 0 e 359\n\r";

        restricoes += d < 0
            ? d > -r ? "" : "Destino esta alem do limite do raio\n\r"
            : d < h  ? "" : "Destino esta alem do limite de altura\n\r";

        return restricoes;
    }

    private double caminhoCurvo(int destino, int angulo) {
        //Calcula o cateto correspondente ao percurso horizontal na superfice curva
        double catetoArc = r * Math.PI * (angulo/ 180.0);

        //Calcula cateto projetado verticalmente na superficie curva
        double catetoH = s - destino;

        return Math.sqrt((catetoArc * catetoArc) + (catetoH * catetoH));
    }

    private double caminhoPeloTopo() {
        //Avalia grau a grau qual o ponto de menor distancia via superficie curva
        int g1 = g;
        double distancia = -1, menorDistancia = -1;

        //Busса a menor distancia percorrendo cada grau entre o grau com o destino e o grau 0
        //Encerra a busca se a distancia calculada aumentar em relação a menor distancia localizada
        do {
            //Ponto de destino na superficie plana do topo, calcula o cateto pela altura a partir da borda do topo, usando 0 como distancia
            distancia = caminhoCurvo(0, g1);

            //Soma-se a distancia da borda até o ponto de destino
            distancia += Math.sqrt((r * r) + (d * d) - (2 * r * Math.abs(d) * Math.cos(Math.PI * (g-g1)/180)));

            //Preserva a menor distancia encontrada
            if((menorDistancia > distancia) || (menorDistancia == -1)) {
                menorDistancia = distancia;
            }
        } while((--g1 > -1) && (distancia <= menorDistancia));

        return menorDistancia;
    }
}
