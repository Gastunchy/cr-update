FROM nginx
RUN apt-get update && apt-get install -y git
#ENV GITHUB_TOKEN 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
# RUN git clone https://$GITHUB_TOKEN@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN git clone https://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@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
#FROM nginx
#RUN apt-get update && apt-get install -y git
#RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
