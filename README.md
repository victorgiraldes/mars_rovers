## Projeto Sondas em marte

### Descrição

Este projeto tem como objetivo desenvolver sondas para explorar a superfície de Marte. As sondas são equipadas com diversos sensores para coletar dados sobre o ambiente marciano.

### Funcionalidades

- Controle remoto das sondas

### Tecnologias Utilizadas

- Ruby on Rails
- RSpec para testes

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
4. Dê permissão ao arquivo de execução:
  ```bash
  chmod +x bin/run
  ```  
5. Execute os comandos para iniciar as instruções da sonda:
  ```bash
  bin/run file.txt
  ```
6. Verifique o arquivo de saída com os resultados (detalhes da localização da sonda):
  ```bash
  public/output.txt
  ```
### Modelo de arquivo de entrada
  ```bash
  5 5
  1 2 N
  LMLMLMLMM
  3 3 E
  MMRMMRMRRM
  ```
### Modelo de arquivo de saida
  ```bash
  1 3 N
  5 1 E
  ```

### Execução dos testes
  ```bash
  bundle exec rspec
  ```

### Descrição das Entidades

#### Plateau

A entidade Plateau é responsável por armazenar os dados do platô, como seus limites.

#### Rover

A entidade Rover é responsável por coordenar a orientação da sonda (L, R, M).

### Descrição dos casos de uso

#### Read Rover Commands

Este caso de uso é responsável por ler o arquivo de entrada, validar os dados e gerar o arquivo de saída com a localização atual da sonda.

### Descrição dos serviços

#### Rover Command Runner

Este serviço é responsável por executar as instruções da sonda.