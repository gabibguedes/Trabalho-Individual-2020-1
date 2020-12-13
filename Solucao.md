# Solução do Trabalho Individual de GCES

[![Build Status](https://travis-ci.com/gabibguedes/Trabalho-Individual-2020-1.svg?branch=master)](https://travis-ci.com/gabibguedes/Trabalho-Individual-2020-1) [![Maintainability](https://api.codeclimate.com/v1/badges/6a3289d4132839bf2015/maintainability)](https://codeclimate.com/github/gabibguedes/Trabalho-Individual-2020-1/maintainability)

**Aluna:** Gabriela Barrozo Guedes

**Matricula:** 16/0121612

## Conteinerização

O projeto foi dividido em 3 containers, **frontend**, **database** e **api**, um para cada aplicação do projeto.

Para a criação desses ambientes dockerizados, foi criado um arquivo `docker-compose.yml` na raiz do projeto e arquivos `Dockerfile` localizados na pasta `/docker`.

Os containers da api e do banco de dados estão inseridos em uma network chamada **project_network**, de forma que facilita e protege as comunicações entre os containers com o uso de variáveis de ambiente definidas para o acesso da api ao banco.

Foi tambem utilizado os volumes **db**, **gems** e **node_modules** para armazenar o banco de dados e as instalações das bibliotecas utilizadas pelo Ruby on Rails e pelo Node JS, de forma que as bibliotecas são baixadas somente uma vez, e não a cada vez que o projeto é rodado.

### Como rodar o projeto

Para subir toda a stack do projeto, basta rodar o comando abaixo:

```sh
docker-compose up
```

Após rodar o comando as aplicações estarão funcionando nos endpoints:

- Frontend: `http://localhost:8080/`
- Backend: `http://localhost:3000/`

### Testes
Para rodar os testes nos ambientes dockerizados, utilize os seguintes comandos:

**Frontend**:

```sh
docker-compose run --rm  frontend /scripts/test.sh
```

**Backend**:

```sh
docker-compose run --rm  api /scripts/test.sh
```

## Integração Continua

A integração continua do projeto foi feita utilizando o Travis CI, onde foram estabelecidos os estágios de **build** e **test**, que são rodados a cada commit do projeto. Para fazer essas configurações foi criado um arquivo `.travis.yml` na raiz do projeto com as configurações necessárias e foi adicionado o Travis CI ao repositório.

Para a coleta de métricas de qualidade do código, foi utilizado o Code Climate.

A branch `master` do repositório está protegida no repositório, de modo que toda atualização deve ser feita por meio de Pull Request. Nos PR's são rodados os estágios de build e teste do Travis CI e a qualidade do código é verificada pelo Code Climate. O PR só é habilitado para merge se todos os estágios (de build, teste e qualidade) forem concluídos com sucesso, caso algum estágio falhe, não é possivel fazer o merge do PR na branch master.

## Deploy Continuo

O deploy foi feito na Digital Ocean. Para a automação do deploy, foi utilizado o Travis CI, onde a cada update feito na branch `master` o projeto em produção é atualizado. 

Para essa configuração foi adicionado um estágio de deploy ao arquivo `.travis.yml`. Nesse passo, é feito um ssh na máquina da Digital Ocean com um script que atualiza o repositório da máquina na branch master e sobe novamente os containers.

O projeto pode ser acessado pelas urls:

- Frontend: [`http://67.205.150.225:8080/`](http://67.205.150.225:8080/)
- Backend: [`http://67.205.150.225:3000/`](http://67.205.150.225:3000/)

## Referências

- [Docker Docs - Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)
- [Digital Ocean - Conteinerizando um aplicativo Ruby on Rails para desenvolvimento com o Docker Compose](https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose-pt)
- [Travis CI - Setting up a CI/CD Process on GitHub with Travis CI](https://blog.travis-ci.com/2019-05-30-setting-up-a-ci-cd-process-on-github)
- [Travis CI - Using Docker in Builds](https://docs.travis-ci.com/user/docker/)
- [Travis CI - Script deployment](https://docs.travis-ci.com/user/deployment/script/)
- [Deploying To DigitalOcean From Travis](https://menubar.io/deploying-to-digitalocean-travis)
