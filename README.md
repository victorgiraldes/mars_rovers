## Projeto Sondas em marte

### Descrição

Este projeto tem como objetivo desenvolver sondas para explorar a superfície de Marte. As sondas são equipadas com diversos sensores para coletar dados sobre o ambiente marciano.

### Funcionalidades

- Controle remoto das sondas

### Tecnologias Utilizadas

- Ruby on Rails

### Como Executar

1. Clone o repositório:
  ```bash
  git clone https://github.com/victorgiraldes/mars_rovers.git
  ```
2. Navegue até o diretório do projeto:
  ```bash
  cd mars_rovers
  ```
3. Instale as dependências:
  ```bash
  bundle install
  ```
4. De a permissão ao arquivo run
  ```bash
  chmod +x bin/run
  ```  
5. Executar os commandos para execução das instruções da sonda:
  ```bash
  bin/run file.txt
  ```
6. Arquivo de saida de resultados(Detalhes da localização da sonsa)
  ```bash
  public/output.txt
  ```
# Descrição das entidades

## Plateau

A entidade Plateau é responsável por armazenar os dados do Plato como o limite do mesmo.

## Rover

A entidade Rover é responsável por coordenar a orientação da sonda. (L, R, M)

# Descrição do services

## Read Rover Commands

Este serviço é responsável por fazer a leitura do arquivo de entrada e validar os dados assim como gerar o arquivo de saída com a ocalização atual da sonda.

## Rover Command Runner

Este serviço é responsável por executar as instruções da sonda.

### Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

### Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.