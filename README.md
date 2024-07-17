### Build da imagem do projeto

docker-compose up --build

### Organização do projeto

/meu-projeto
|-- certs/
|-- public/
| |-- index.html
| |-- .htaccess
|-- scripts/
| |-- entrypoint.sh
|-- Dockerfile
|-- docker-compose.yml
|-- my-httpd.conf
|-- my-httpd-ssl.conf
|-- README.md

Dentro da pasta public ficarão seus arquivos do projeto
