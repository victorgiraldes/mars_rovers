## Projeto Sondas em marte

### Descrição

Este projeto tem como objetivo desenvolver sondas para explorar a superfície de Marte. As sondas são equipadas com diversos sensores para coletar dados sobre o ambiente marciano.

### Funcionalidades

- Controle remoto das sondas

### Tecnologias Utilizadas

- Ruby on Rails
- RSpec para testes
- Factorybot para popular os dados para os testes
- Simplecov(Cobertura de testes)

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
  5 5 <- Identifica o tamanho do platô
  1 2 N <- Identifica a posição do primeira sonda
  LMLMLMLMM <- Intruções para a sonda
  3 3 E <- Identifica a posição da segunda sonda
  MMRMMRMRRM <- Intruções para a sonda
  ```
### Modelo de arquivo de saida
  ```bash
  1 3 N <- Posição da primeira sonda
  5 1 E <- Posição da segunda sonda
  ```

### Execução dos testes
  ```bash
  bundle exec rspec
  ```

### (Simplecov) Localização do arquivo com a cobertura dos testes
  ```bash
  coverage/index.html
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

### Tipos de Erros

#### InvalidDirectionException

Esta exceção é levantada quando uma direção inválida é fornecida ao rover.

#### RoverOutPlateauBoundsException

Esta exceção é levantada quando o rover tenta se mover para fora dos limites do plateau.

#### InvalidInstructionException

Esta exceção é levantada quando a instrução fornecida ao rover é desconhecida.

#### InvalidPlateauBoundsException

Esta exceção é levantada quando os parâmetros de entrada do plato não são números ou estão incompletos