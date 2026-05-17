FROM nginx:latest

# Copiar arquivo HTML para o Nginx
COPY index.html /usr/share/nginx/html/index.html

# Copiar configuração do Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expor porta 80
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]