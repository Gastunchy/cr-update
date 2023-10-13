FROM nginx
RUN apt-get update && apt-get install -y git
ENV GITHUB_TOKEN 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
RUN git clone https://$GITHUB_TOKEN@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
