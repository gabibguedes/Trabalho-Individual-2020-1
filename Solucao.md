# Solução do Trabalho Individual de GCES

**Aluna:** Gabriela Barrozo Guedes
**Matricula:** 16/0121612

## Conteinerização

O projeto foi dividido em 3 containers, **frontend**, **database** e **api**, um para cada aplicação do projeto.

Para a criação desses ambientes dockerizados, foi criado um arquivo `docker-compose.yml` na raiz do projeto e arquivos `Dockerfile` localizados na pasta `/docker`.

Os containers estão inseridos em uma network chamada **project_network**, de forma que facilita e protege as comunicações entre os containers. A comunicação entre o banco de dados e a api, por exemplo, é feita por essa network com o uso de variáveis de ambiente definidas para o acesso ao banco.

Foi tambem utilizado os volumes **db**, **gems** e **node_modules** para armazenar o banco de dados e as instalações das bibliotecas utilizadas pelo ruby on rails e pelo nodejs, de forma que as bibliotecas são baixadas somente uma vez, e não a cada vez que o projeto é rodado.

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
docker-compose run --rm frontend yarn run test:unit
```

**Backend**:

```sh
docker-compose run --rm api bundle exec rails test
```

## Integração Continua

## Deploy Continuo

## Referências

- [Docker](https://docs.docker.com/)
- [Docker Docs - Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)
- [Digital Ocean - Conteinerizando um aplicativo Ruby on Rails para desenvolvimento com o Docker Compose](https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose-pt)
- [SIGE](https://gitlab.com/lappis-unb/projects/SMI/)



