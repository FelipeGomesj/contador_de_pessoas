//temos que importar o 'package:flutter...' para que o nosso comando runApp(); funcione.
// o title é interno e não será visualizado pelos usuários
// o home: Container é nossa tela e demos a cor branca para ela
//Iremos trocar o container do homem e colocar um Column
// temos que especícar um widget dentro do runApp para nosso aplicativo e conforme for o tipo do nosso app a gente preenche, a grande maioria usa-se MaterialApp
//Container é uma tela e nós decidimos a cor dele dentro dos parênteses
//Column é um widget que permite nós colocarmos vários widgets dentro dele na vertical, ou seja, column é um código que permite nós fazermos contruções de widgets dentro dele
//Nós armazenamos a lista de widgets dentro do nosso children: <Widget>[aqui nós passamos a nossa lista de Widget]
//O que é Widget? É  tudo praticamente, se quisermos colocar um texto, usamos widgets, se quisermos colocar um espaçamento ou alinhamento, usamos widgets e assim por diante
//mainAxisAlignment  é para alinhar, é o eixo central da coluna..., ou seja, tudo que estiver abaixo irá ficar alinhado no meio da tela
//para adicionarmos o botão entre os dois textos, temos que ir no meio dos dois textos no código e implementar o código do botão
//Em onPressed: temos uma função anônima () {}
//Row é linha em inglês, é o contrário de Column. ENquanto trabalhamos com as coisas do column na vertical a linha irá trabalhar com os objetos na  horizontal ou seja, Row é o contrário de Column
//mainAxisAlignment: MainAxisAlignment.center é para centralizar! Seja a Column que é na vertical ou a row que é na horizontal
//Padding, permite que você coloca um widget com espaçamento  em volta. padding(espaços nas laterais):EdgeInsets.all (espaços em toda a volta) e o valor do espaço 10.0
//O widget Stack permite que você sobreponha outra widget, ou seja, o texto tem que ficar por cima da imagem e não ao contrário
//fit é para selecioarmos onde e como queremos a imagem, e  o BoxFit.cover é para cobrir todo o fundo  do cenário
//Inserindo imagem. Se for do pc temos  que alterar lá na pasta pibspect.yaml, recomenda-se dar uma olhada para ver e colocar o diretório certinho da imagem aqui dentro do vs code, colocar pasta por pasta como por exemplo lib/images/restaurant.jpg e assim sucessivamente
// Um widget Staless é um widget sem funcionalidade, sem interação e estático que aparecerá para o usuário, por exemplo a nossa tela de fundo... Agora para que a soma e a subtração aconteça e essa funcionalidade ao usuário mexer é outro tipo de widget que são chamado de widget Stateful, esses sim permitem a interação  ao mexer.
//O setState irá atualizar a tela com os comandos que foram mudados dentro dele mesmo nhaaa
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de Pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = 'Entrada liberada';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = 'Não existem pessoas presentes.';
      } else if (_people < 10) {
        _infoText = 'Entrada liberada';
      } else {
        _infoText = 'O recipiente está lotado!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'lib/images/aluguel-climatizador-eventos.png',
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_people',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text('+1',
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text('-1',
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
