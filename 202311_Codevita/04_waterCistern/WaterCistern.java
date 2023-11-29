//Codevata 2023

//Cisterna d'aqua

//Evandro José Graton

import java.util.Scanner:

import java.time. import java.time.format.

public class WaterCistern (

private int r, ha, d, 07 private Scanner sc new Scanner(System.in);

public static void main(String[] args) new WaterCistern().execute();

1

public void execute(){

//Realiza a obtenção validação das variavei

entrada tha (): entrada dg():

//Registra o inicio do calculo ZonedDateTime to ZonedDateTime.now();

double menorDistancia (d) ?

caminho PeloTopo() //Se o destino estiver na superifice plana do sopo, resons o trajeto mais curto entre ir pela superficie curva ou ir pelo topo //Se o destino estiver na superifice curva, o trajeto mais curto será sempre pela superfice curve

caminhoCurvo (d, g):

System.out.printf("\n\rSaida\n\r\d\n\r\n\r", Math.round (menorDistancia)):

//Calcula o tempo de processamento entre to e agore e apresente en fracao de argundos Syatem.out.println("Processamento (3) Duration between (tü, ZonedDateTime.now()).toMillis()/1000.0)

private String validerRaioAlturaörigen () (

String restrinao0Origen precisa ses malos que sui

restricao + h

Alture precise ser melor que 40nir

Mastura prесава виг вироs que 10000tale":
: "Altura precisa ser menor que 10000\n\r";

restricao+<h

"Origem precisa ser menor ou igual a altura\n\r":

reatricao+<0

7 "Rsic nao pode ser valor negativo\n\r

1007: "Ralo precisa ser menor que 100\n\r":

return restricao:

private void entrada rhs() (

String[] valores:

String restricces -

do System.out.println("Entrata");

valores ac.nextLine().split(",");

restricos

try

Integer.parseInt(valores[0]):

h= Integer.parseInt (valores[1]): Integer.parseInt(valores[2]):

reatricoes validerRaioAlturaOrigem():

catch (Exception ex) {

restricces "\n\rTodos os valores informacs devem ser inteizon positivos separados

if(restricces "")

System.out.println(restricoes):

while(restricoes.length() >

private void entrada de() (

String() valores:

String restricoes "

do valorea ac.nextLine().split(","

length
valores sc.nextLine()","

centrione

try

d Integer parar Int (valores [))

gInteger.parseInt(valores():

zentricoes validartestimaAngulo():

catch (Exception ex)

testricoes\a\zTodos os valores informaos devem ser inteiros separados pornirex+\s

if (matricos")

System.out.println(restricoes):

while(restricoes.length() > 0):

//Semua angulos masores que 180 para quadrante 0-180

private String validarDestinoAngulo)(

String restricoes (< 0) 64 (0 < 359)

Mangulo precisa ser entre 359ne:

zescricoesto

3

24-27"Destino case alem do limite do zaze\n\ dh? Destino esta sien du linte de alturalnis

retorn restricces

private double caminteCarvoist destino, ant angulo) (

//Calcule o cateto correspondente as gerousso horizontal ne superfice curva double catetolen Math.PI (angulo/.:

double catetol

//Calculs catéto projetann verticsimente na expertsise curve

return Math.agrt((cate catetoArc) + (catetoll cateton):

52

1

pelvate Souble caminho Peiotopo
valores sc.nextLine()","

centrione

try

d Integer parar Int (valores [))

gInteger.parseInt(valores():

zentricoes validartestimaAngulo():

catch (Exception ex)

testricoes\a\zTodos os valores informaos devem ser inteiros separados pornirex+\s

if (matricos")

System.out.println(restricoes):

while(restricoes.length() > 0):

//Semua angulos masores que 180 para quadrante 0-180

private String validarDestinoAngulo)(

String restricoes (< 0) 64 (0 < 359)

Mangulo precisa ser entre 359ne:

zescricoesto

3

24-27"Destino case alem do limite do zaze\n\ dh? Destino esta sien du linte de alturalnis

retorn restricces

private double caminteCarvoist destino, ant angulo) (

//Calcule o cateto correspondente as gerousso horizontal ne superfice curva double catetolen Math.PI (angulo/.:

double catetol

//Calculs catéto projetann verticsimente na expertsise curve

return Math.agrt((cate catetoArc) + (catetoll cateton):

52

1

pelvate Souble caminho Peiotopo
private double caminholeloTopo() |

Avalia grau a grau qual o ponto de menor itistancia via superfice curva

int gl gr double distancia menorDistancia

//болса и вence distancia percorrendo cada gran entre o grau de destino e o grau 0

//Encerts & busca se distancia calculada aumentar em relação a menor distancia localizada

//Fanto de destino na superficie plana do tepo, calcula distancia caminhocuzvo(, gl) cateto pela altura a partir da borda do sopo, usando como distancia

//Soma-se a distancis da borda até o ponto de destino

distancia Math.sqrt(i+10)(Math.abs(d) Math.cos (Math.PI (0-1)/00)

//Preserva a menor distancia encontrada if((menurDistancia distancia) 11 (menor Distancia menorDistancia distancia

while(166 (distancia <- menorDistancia)))

return nenorDistancie
