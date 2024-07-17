# Use a imagem base do Apache
FROM httpd:latest

# Copie os arquivos de configuração do Apache
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./my-httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# Copie os certificados SSL
COPY ./certs/apache-selfsigned.crt /usr/local/apache2/conf/server.crt
COPY ./certs/apache-selfsigned.key /usr/local/apache2/conf/server.key

# Copie seu site para o diretório padrão do Apache
COPY ./public/ /usr/local/apache2/htdocs/

# Copie o arquivo .htaccess para o diretório do site
COPY ./public/.htaccess /usr/local/apache2/htdocs/.htaccess
