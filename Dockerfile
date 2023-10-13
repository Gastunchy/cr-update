FROM nginx
RUN apt-get update && apt-get install -y git
RUN git clone https://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@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
