import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

int? cont;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Criar Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pacotes de Viagens'),
        backgroundColor: Color.fromARGB(255, 191, 62, 214),
      ),
      body: ListView(
        children: [
          Componente('Angra dos Reis', 'imagens\\Angra dos Reis.jpg', 384, 70),
          Componente('Jericoacoara', 'imagens\\Jericoacoara.png', 571, 75),
          Componente(
              'Arraial do Cabo', 'imagens\\Arraial do Cabo.jpg', 534, 65),
          Componente('Florianópolis', 'imagens\\Florianópolis.jpg', 348, 85),
          Componente('Madri', 'imagens\\Madri.jpg', 401, 85),
          Componente('Paris', 'imagens\\Paris.jpg', 546, 95),
          Componente('Orlando', 'imagens\\Orlando.jpg', 616, 105),
          Componente('Las Vegas', 'imagens\\Las Vegas.jpg', 504, 110),
          Componente('Roma', 'imagens\\Roma.png', 478, 85),
          Componente('Chile ', 'imagens\\Chile.jpg', 446, 95)
        ],
      ),
    );
  }
}

class Componente extends StatefulWidget {
  final String nome_comp;
  final String img;
  final double valorDia;
  final double valorPessoa;
  Componente(this.nome_comp, this.img, this.valorDia, this.valorPessoa,
      {super.key});

  @override
  State<Componente> createState() => _Componente();
}

class _Componente extends State<Componente> {
  int contPessoas = 0;
  int contDias = 0;
  double total = 0;

  void _calc() {
    setState(() {
      total = (contDias * widget.valorDia) + (contPessoas * widget.valorPessoa);
    });
  }

  void _increment_counter_pessoas() {
    // Função set state monitora o estado das variáveis da classe Stateful
    setState(() {
      contPessoas++;
    });
  }

  void _sub_counter_pessoas() {
    // Função set state monitora o estado das variáveis da classe Stateful
    setState(() {
      contPessoas--;
      if (contPessoas <= 0) {
        contPessoas = 0;
      }
    });
  }

  void _increment_counter_dias() {
    // Função set state monitora o estado das variáveis da classe Stateful
    setState(() {
      contDias++;
    });
  }

  void _sub_counter_dias() {
    // Função set state monitora o estado das variáveis da classe Stateful
    setState(() {
      contDias--;
      if (contDias <= 0) {
        contDias = 0;
      }
    });
  }

  void _clear_counter() {
    // Função set state monitora o estado das variáveis da classe Stateful
    setState(() {
      contPessoas = 0;
      contDias = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                color: Color.fromARGB(255, 191, 62, 214),
                width: 400,
                height: 35),
            Container(
              color: const Color.fromARGB(255, 234, 114, 255),
              width: 393,
              height: 250,
              child: Image.asset(
                widget.img,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              '${widget.nome_comp}',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              color: Color.fromARGB(255, 234, 114, 255),
              width: 350,
              height: 35,
              child: Text(
                'Quantidade de Pessoas: $contPessoas',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Color.fromARGB(255, 234, 114, 255),
              width: 350,
              height: 35,
              child: Text(
                'Quantidade de Dias: $contDias',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Color.fromARGB(255, 234, 114, 255),
              width: 350,
              height: 35,
              child: Text(
                'Valor Total: R\$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.white,
                  child: Text(
                    'Quantidade de Dias:       ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _increment_counter_dias();
                      _calc();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 191, 62, 214)),
                    child: Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {
                      _sub_counter_dias();
                      _calc();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 191, 62, 214)),
                    child: Icon(Icons.remove)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.white,
                  child: Text(
                    'Quantidade de Pessoas:',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _increment_counter_pessoas();
                      _calc();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 191, 62, 214)),
                    child: Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {
                      _sub_counter_pessoas();
                      _calc();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 191, 62, 214)),
                    child: Icon(Icons.remove)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _clear_counter();
                      _calc();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 191, 62, 214),
                        padding:
                            EdgeInsetsDirectional.fromSTEB(180, 10, 180, 10)),
                    child: Icon(Icons.cleaning_services)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
