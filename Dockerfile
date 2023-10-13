# Utiliza una imagen base con NGINX y cron
FROM nginx:latest

# Instala cron
RUN apt-get update && apt-get -y install cron

# Copia el contenido del repositorio
RUN apt-get -y install git
RUN git clone https://github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN git clone https://github.com/Gastunchy/cr-update.git /tmp/repo

# Copia el archivo de configuración cron al contenedor
COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob

# Copia el archivo index.html de NGINX (este archivo debe existir en tu host)
# COPY index.html /usr/share/nginx/html/
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
# Exponer el puerto 80
EXPOSE 80

# Iniciar NGINX y el demonio cron
CMD service cron start && nginx -g 'daemon off;'
#----------------
#FROM nginx
#RUN apt-get update && apt-get install -y git
#RUN git clone https://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@github.com/Gastunchy/cr-update-page.git /tmp/repo
#RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
