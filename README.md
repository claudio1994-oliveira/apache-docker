ServerName localhost

## Criação dos certificados autoassinados

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout certs/apache-selfsigned.key -out certs/apache-selfsigned.crt

## Build da imagem do projeto

docker-compose up --build

## Organização do projeto

/meu-projeto
|-- certs/
| |-- apache-selfsigned.crt
| |-- apache-selfsigned.key
|-- public/
| |-- index.html
| |-- .htaccess
|-- Dockerfile
|-- docker-compose.yml
|-- my-httpd.conf
|-- my-httpd-ssl.conf
|-- README.md

Dentro da pasta public ficarão seus arquivos do projeto
