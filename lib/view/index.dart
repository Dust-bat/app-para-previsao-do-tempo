import 'package:flutter/material.dart';
import 'package:previsao_tempo/model/apibrasil.dart';


class Index extends StatefulWidget {
  const Index({super.key});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final TextEditingController nomeCidadeController = TextEditingController();
  String status = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nomeCidadeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previsão do Tempo"),
        backgroundColor: Color.fromARGB(207, 225, 180, 34),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: RadialGradient(
                colors: [
                  Colors.yellow,
                  Colors.orange,
                  Colors.deepPurple,
                  Colors.black
                ],
                radius: 1.2,
                center: Alignment.topCenter,
                tileMode: TileMode.clamp),
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(
                maxWidth: 200,
                minWidth: 200,
                maxHeight: 200,
                minHeight: 200,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    controller: nomeCidadeController,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      label: Text("Infome sua cidade"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String nameCity = nomeCidadeController.text;
                        //print(nameCity);
                        ApiBrasil apiBrasil = ApiBrasil(nameCity);
                        apiBrasil.getCodCidade().then((value) {
                          if (value['cidade'] != null) {
                            Navigator.pushNamed(context, '/tela1', arguments: value);
                          } else {
                            setState(() {
                              status = value['message'];
                              print(status);
                            });
                          }
                        });
                      },
                      child: Text("OK")),
                  Text(status),
                ],
              ),
            ),
          ],
        )),
      ]),
    );
  }
}