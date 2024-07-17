# Use a imagem base do Apache
FROM httpd:latest

# Instalar Certbot
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-apache

# Copiar os arquivos de configuração do Apache
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./my-httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# Copiar seu site para o diretório padrão do Apache
COPY ./public/ /usr/local/apache2/htdocs/

# Copiar o arquivo .htaccess para o diretório do site
COPY ./public/.htaccess /usr/local/apache2/htdocs/.htaccess

# Copiar o script de entrada
COPY ./scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expor as portas 80 e 443
EXPOSE 80 443

# Definir o script de entrada
ENTRYPOINT ["/entrypoint.sh"]
