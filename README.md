# previsao_tempo

A new Flutter project.

Projeto feito como requisito para obtenção de nota na disciplina - Opt I - Desenvolvimento de Software Mobile.

# Desenvolvedores

- João Victor Bastos.
- Alan Matos.

# APIs Utilizadas

### Buscar localidades
Retorna listagem com todas as cidades correspondentes ao termo pesquisado junto a seus respectivos códigos presentes nos serviços da CPTEC. O Código destas cidades será utilizado para os serviços de meteorologia e a ondas (previsão oceânica) fornecido pelo centro.
```Sh
https://brasilapi.com.br/api/cptec/v1/cidade/{cityName}
```

### Previsão meteorológica para, até, 6 dias
Retorna a previsão meteorológica para a cidade informada para um período de 1 até 6 dias. Devido a inconsistências encontradas nos retornos da CPTEC nossa API só consegue retornar com precisão o período máximo de 6 dias.
```Sh
https://brasilapi.com.br/api/cptec/v1/clima/previsao/{cityCode}/{days}
```

As apis utilizadas foram obtidas no site [ApiBrsil.com.br](https://brasilapi.com.br/docs#tag/Termos-de-uso).
