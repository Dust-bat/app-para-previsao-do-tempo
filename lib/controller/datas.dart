import 'package:intl/intl.dart';

String obterDiaDaSemana(String dataString) {
  DateTime data = DateTime.parse(dataString);
  switch (data.weekday) {
    case 1:
      return 'Segunda-feira';
    case 2:
      return 'Terça-feira';
    case 3:
      return 'Quarta-feira';
    case 4:
      return 'Quinta-feira';
    case 5:
      return 'Sexta-feira';
    case 6:
      return 'Sábado';
    case 7:
      return 'Domingo';
    default:
      return ''; // Retorna uma string vazia se o valor estiver fora do intervalo de 1 a 7
  }
}

String formatarData(String dataString) {
  DateTime data = DateTime.parse(dataString);
  return DateFormat('dd/MM/yyyy').format(data);
}

String? imagem(String condicao) {
  if(condicao == 'pc') {
    return 'pancadas_chuva.png';
  } else if (condicao == 'pn'){
    return 'parc_nublado.png';
  } else if (condicao == 'c') {
    return 'chuvoso.png';
  } else if (condicao == 'ps') {
    return 'ensolarado.png';
  } else if (condicao == 'n') {
    return 'nublado.png';
  }
  return 'not_find.png';
}