FROM nginx
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/Gastunchy/cr-update.git /tmp/repo
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
