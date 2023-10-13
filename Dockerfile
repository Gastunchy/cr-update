# Utiliza una imagen base con NGINX y cron
FROM nginx:latest

# Instala cron
RUN apt-get update && apt-get -y install cron

# Instalar git y clona el contenido del repositorio donde esta la pagina web (https://github.com/Gastunchy/cr-update-page.git)
RUN apt-get -y install git
RUN git clone https://github.com/Gastunchy/cr-update-page.git /tmp/repo

# Copia el archivo index.html de NGINX (este archivo debe existir en tu host)
# COPY index.html /usr/share/nginx/html/
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html

# Crea el archivo "cronjob" con contenido especifico en "/etc/cron.d/"
## Crea una tarea para actualizar el contenido del repo cada 1 min
RUN echo '* * * * * root git -C /tmp/repo pull' > /etc/cron.d/cronjob
## Crea una tarea para reemplazar index.html del repositorio copiado localmente y reemplazarlo en /usr/share/nginx/html cada 1 min
RUN echo '* * * * * root cp /tmp/repo/index.html /usr/share/nginx/html' >> /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob

# Iniciar NGINX y el demonio cron
CMD service cron start && nginx -g 'daemon off;'
