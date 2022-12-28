import 'dart:math';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagesApp = AssetImage('images/padrao.png');
  var _mensagemPadrao = 'Escolha uma opção abaixo';
  var _perdedor = 'Que pena você perdeu ';
  var _ganhador = 'Parabéns você ganhou ';
  var _empate = 'ninguém ganhou';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var i = Random().nextInt(3);
    var escolhaApp = opcoes[i];

    // Alteração da escolha do app
    switch (escolhaApp){
      case'pedra': setState(() {
        this._imagesApp = AssetImage('images/pedra.png');
      });
      break;
      case 'papel': setState(() {
        this._imagesApp = AssetImage('images/papel.png');
      });
      break;
      case 'tesoura': setState(() {
        this._imagesApp = AssetImage('images/tesoura.png');
      });
    }
    // Perdeu
    if (escolhaApp == 'tesoura' && escolhaUsuario == 'papel' ||
        escolhaApp == 'papel' && escolhaUsuario == 'pedra'   ||
        escolhaApp == 'pedra' && escolhaUsuario == 'tesoura'  ){
      setState(() {
        _mensagemPadrao = _perdedor;
      });
    }
    // Ganhou
    else if (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura' ||
        escolhaUsuario == 'tesoura' && escolhaApp == 'papel' ||
        escolhaUsuario == 'papel' && escolhaApp == 'pedra'){
      setState(() {
        _mensagemPadrao = _ganhador;
      });
    }
    // Empatou
    else{
      setState(() {
        _mensagemPadrao = _empate;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Image(
            image: _imagesApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagemPadrao,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('images/pedra.png', height: 95,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('images/papel.png', height: 95,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('images/tesoura.png', height: 95,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
