/*
uma stream representa uma fonte de eventos/dados que ocorrem ao longo do tempo
QUANDO USAR
- quando você precisa escutar atualizações continuas.
- ex: GPS, mensagens de chat, digitação em tempo real, eventos de usuário

CARACTERÍSTICAS
- PODE EMITIR VALORES COM YIELD
- PODE DURAR INDEFINIDAMENTE
- PODE SER USADA COM LISTEN OU AWAIT FOR 
- DEVEMOS USAR ASYNC* PARA DECLARAR FUNÇÕES ASSÍNCRONAS QUE RETORNAM UMA STREAM
 */

//exemplo 1 - contador de tempo
/* Stream<int> contadorTempo() async*{
  for(int i = 0; i < 10; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i; //yield serve como um emissor, ele emite a nova informação para a stream,
    //como se fosse um return. Porém sem finalizar a função.
  }
}

//exemplo 2 - simulação de chat
Stream<String> mensagemChat() async*{
  yield 'oi';
  await Future.delayed(Duration(seconds: 1));
  yield "tudo bem?";
  await Future.delayed(Duration(seconds: 1));
  yield "sim e vc?";
  await Future.delayed(Duration(seconds: 1));
  yield "que bom!!";
  await Future.delayed(Duration(seconds: 1));
  yield "tchau.";
}

void main(List<String> args) {
  /*contadorTempo().listen(
    (event) => print("contagem: $event"),
    onDone:() => print("stream finalizada"),
  );*/

  mensagemChat().listen(
    (mensagem) => print(mensagem),
    onDone: () => print("fim do chat."),
    ); */
//}

//exemplos com controle de erro try cath
Stream<int> contarTempo() async*{
  try{
    for(int i = 0; i < 10; i++){
      await Future.delayed(Duration(seconds: 1));
      if(i == 3){
        throw Exception("erro ao contar número: $i");
      }
      yield i;
    }
  }catch(e){
    print("Erro no contador de tempo: $e");
  }
}

void main(List<String> args) {
  contarTempo().listen(
    (event) => print("Número: $event"),
    onError: (erro) => print(erro),
    onDone: () => print("finalizado"),
  );
}