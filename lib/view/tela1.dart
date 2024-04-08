import 'package:flutter/material.dart';
import 'package:previsao_tempo/controller/datas.dart';


class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> dados =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final List<dynamic> clima = dados['clima'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(207, 225, 180, 34),
        title: Text(
            '${dados['cidade']} - ${dados['estado']}',
            overflow: TextOverflow.fade,),
      ),
      body: Stack(
        children: [
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
          ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                var dia = obterDiaDaSemana(clima[index]['data']);
                var dataF = formatarData(clima[index]['data']);
                var image = imagem(clima[index]['condicao']);
                return ListTile(
                  title: Text(
                    '$dia    $dataF',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 249, 249),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5, // Espaço entre a imagem e o texto
                          ),
                          Image(
                            image: AssetImage('assets/temp_max.png'),
                          ),
                          Text(
                            'Máx ${clima[index]['max']}°C | ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 249, 249),
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/temp_min.png'),
                          ),
                          Text(
                            'Mín ${clima[index]['min']}°C',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 249, 249),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5, // Espaço entre a imagem e o texto
                          ),
                          Image(
                            image: AssetImage('assets/uv_indice.png'),
                          ),
                          Text(
                        'Índice UV ${clima[index]['indice_uv']}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 249, 249),
                        ),
                      ),
                        ]
                        
                      ),
                      
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                            image: AssetImage('assets/$image'),
                          ),
                      Text(
                        '${clima[index]['condicao_desc']}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 249, 249),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: clima.length),
        ],
      ),
    );
  }
}