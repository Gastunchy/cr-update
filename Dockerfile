FROM nginx
RUN apt-get update && apt-get install -y git
ENV GITHUB_TOKEN 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
RUN git clone https://$GITHUB_TOKEN@github.com/Gastunchy/cr-update-page.git /tmp/repo
RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
#FROM nginx
#RUN apt-get update && apt-get install -y git
# RUN git clone https://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@github.com/Gastunchy/cr-update-page.git /tmp/repo
#RUN mv /tmp/repo/index.html /usr/share/nginx/html/index.html
