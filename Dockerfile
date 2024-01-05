FROM cgr.dev/chainguard/nginx
COPY /src /usr/share/nginx/html
EXPOSE 8080