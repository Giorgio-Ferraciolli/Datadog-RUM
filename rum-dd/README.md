# 🐳 Datadog RUM - Setup Docker + Nginx

## 📋 Arquivos necessários:
```
projeto/
├── index.html           (página HTML com RUM)
├── Dockerfile           (imagem Docker)
├── nginx.conf          (configuração do Nginx)
├── docker-compose.yml  (orquestração)
└── README.md           (este arquivo)
```

## 🚀 Como executar:

### 1️⃣ **Pré-requisitos**
- Docker instalado: https://www.docker.com/products/docker-desktop
- Docker Compose (vem com Docker Desktop)

### 2️⃣ **Clonar ou criar a pasta do projeto**
```bash
mkdir datadog-rum-study
cd datadog-rum-study
```

### 3️⃣ **Colocar os 4 arquivos na pasta**
- `index.html`
- `Dockerfile`
- `nginx.conf`
- `docker-compose.yml`

### 4️⃣ **Configurar suas credenciais do Datadog**

Crie uma aplicação RUM em https://app.datadoghq.com/rum/application/create e edite [index.html](index.html), substituindo os placeholders:

```js
const DD_CONFIG = {
    applicationId: 'YOUR_APPLICATION_ID',   // <- substitua aqui
    clientToken: 'YOUR_CLIENT_TOKEN',       // <- substitua aqui
    site: 'datadoghq.com',                  // ou datadoghq.eu, us3, us5...
    service: 'my-frontend-app',             // nome da sua aplicação
    env: 'development',
    version: '1.0.0'
};
```

> ⚠️ **Nunca commite credenciais reais no Git.** Esse projeto serve apenas como template de estudo.

### 5️⃣ **Build e executar com Docker Compose**
```bash
# Criar e iniciar o container
docker-compose up --build

# Saída esperada:
# datadog-rum-app  | [...] listening on [::]:80
```

### 6️⃣ **Acessar a aplicação**
Abrir no navegador:
```
http://localhost:8080
```

---

## 🎯 Testando o RUM

### Ao carregar a página:
1. ✅ RUM inicializa automaticamente com suas credenciais
2. 📊 Um **pageview** é enviado para Datadog
3. 📋 Log de eventos aparece em tempo real

### Testar recursos:
- **📄 Pageviews**: Clique em "Home", "Produtos", etc
- **🖱️ Ações**: Clique em botões para enviar ações
- **❌ Erros**: Dispare JS errors
- **🔗 Requisições**: Simule requests HTTP
- **👤 Contexto**: Configure dados do usuário

---

## 🛑 Parar o container

```bash
# Parar e remover
docker-compose down

# Parar sem remover
docker-compose stop

# Reiniciar
docker-compose restart
```

---

## 🔍 Ver logs do container

```bash
# Logs em tempo real
docker-compose logs -f

# Logs do Nginx
docker-compose logs rum-app
```

---

## 📊 Ver dados no Datadog

1. Acesse: https://app.datadoghq.com/rum/explorer
2. Selecione sua aplicação (o `service` configurado em `index.html`)
3. Você verá:
   - ✅ Pageviews
   - 🎯 User Actions
   - ❌ Errors
   - 🔗 Resources
   - 📹 Session Replays

---

## 🔧 Troubleshooting

### Erro: "docker-compose: command not found"
```bash
# Use docker compose (sem hífen)
docker compose up --build
```

### Porta 8080 já em uso
Edite `docker-compose.yml`:
```yaml
ports:
  - "3000:80"  # Mude para 3000 ou outra porta
```

### Credenciais do Datadog não funcionam
1. Verifique se `applicationId` está correto
2. Verifique se `clientToken` está correto
3. Confirme o `site` (datadoghq.com / datadoghq.eu)

---

## 💡 Personalizações

### Mudar porta
Edite `docker-compose.yml`:
```yaml
ports:
  - "5000:80"  # Acesse em http://localhost:5000
```

### Mudar timezone
Edite `docker-compose.yml`:
```yaml
environment:
  - TZ=America/Sao_Paulo  # Ou outra timezone
```

### Adicionar HTTPS (SSL)
Crie um certificado e atualize `nginx.conf`

---

**⚠️ Nota**: Essas são apenas para estudo. Em produção, nunca compartilhe seus tokens!

---

## 🎓 Próximos passos

1. ✅ Explorar RUM Explorer no Datadog
2. 🔍 Entender Session Replay
3. 📊 Criar custom dashboards
4. 🎯 Integrar com seu próprio frontend (React/Vue/Angular)

---

Qualquer dúvida, é só chamar! 🚀