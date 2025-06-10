/*
programação assincrona é um modelo de programação onde as
operações que podem levar tempo para serem concluídas (como
chamadas de rede, leitura de arquivos ou espera por eventos)
são executadas sem bloquear o fluxo principal do programa.

CONCEITO TÉCNICO
em vez de esperar uma tarefa demorada terminar antes de continuar,
a programação assincrona registra um callback (função de retorno) ou
usa estruturas como Future, Stream, async/await para desbloquear a tarefa e continuar
executando o restante do código. Quando a tarefa termina, o resultado é 
entregue automaticamente.

NO DART
Future<T> => representa uma operação assíncrona que eventualmente retorna um valor do tipo T
async e awit => permitem escrever código assíncrono como se fosse síncrono
Stream<T> => representa uma sequência assíncrona de valores (ex: eventos, dados em séries).
*/

void main(List<String> args) {
  imprimeNumeros();

  }

  imprimeNumeros() async{
    numero1();
    await numero2(); // aguarde o resultado da função
    numero3();
  }
  numero1(){
    print("numero 1");
  }
  Future<void> numero2(){
    return Future.delayed(Duration(seconds: 2,), () => print("numero 2"));
  }
numero3(){
    print("numero 3");
  }