#!/bin/bash

# Iniciar Apache em modo de segundo plano para que Certbot possa verificar o domínio
apachectl start

# Verificar se os certificados já existem
if [ ! -f /etc/letsencrypt/live/example.com/fullchain.pem ]; then
  # Executar Certbot para obter certificados
  certbot certonly --apache --non-interactive --agree-tos -m seu-email@example.com -d example.com -d www.example.com
  
  # Copiar os certificados para o diretório de configuração do Apache
  cp /etc/letsencrypt/live/example.com/fullchain.pem /usr/local/apache2/conf/server.crt
  cp /etc/letsencrypt/live/example.com/privkey.pem /usr/local/apache2/conf/server.key
fi

# Substituir as referências aos certificados no arquivo de configuração SSL do Apache
sed -i 's|/etc/letsencrypt/live/example.com/fullchain.pem|/usr/local/apache2/conf/server.crt|g' /usr/local/apache2/conf/extra/httpd-ssl.conf
sed -i 's|/etc/letsencrypt/live/example.com/privkey.pem|/usr/local/apache2/conf/server.key|g' /usr/local/apache2/conf/extra/httpd-ssl.conf

# Parar o Apache
apachectl stop

# Iniciar o Apache em primeiro plano
httpd-foreground
