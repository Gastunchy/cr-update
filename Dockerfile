FROM nginx
RUN apt-get update && apt-get install -y git
#ENV GITHUB_TOKEN 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
# RUN git clone https://$GITHUB_TOKEN@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN git clone https://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@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
#FROM nginx
#RUN apt-get update && apt-get install -y git
#RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
