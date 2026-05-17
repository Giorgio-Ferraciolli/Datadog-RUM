# Datadog-RUM

Repositório de estudos e experimentos com **Datadog Real User Monitoring (RUM)**.

Aqui ficam pequenos projetos autocontidos usados para explorar recursos do produto: inicialização do Browser SDK, captura de pageviews, ações, erros, recursos (XHR/Fetch), Session Replay, contexto de usuário, etc.

---

## 📂 Estrutura do repositório

Cada pasta na raiz é um projeto/experimento independente, com seu próprio `README.md` e instruções de execução.

```
Datadog-RUM/
└── rum-dd/        # Setup Docker + Nginx servindo uma página estática com Datadog RUM
```

| Projeto | Descrição | Stack |
|---|---|---|
| [`rum-dd/`](./rum-dd) | Página HTML estática integrada ao Datadog Browser SDK, servida via Nginx em container Docker. Botões para disparar pageviews, ações customizadas, erros JS, requisições XHR/Fetch e definir contexto de usuário. | HTML · JS · Docker · Nginx |

> Novos experimentos serão adicionados como subpastas seguindo o mesmo padrão.

---

## 🚀 Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/Giorgio-Ferraciolli/Datadog-RUM.git
   cd Datadog-RUM
   ```
2. Entre na pasta do projeto de interesse (ex.: `cd rum-dd`).
3. Siga o `README.md` dentro daquele projeto.

---

## 🔐 Sobre credenciais

Nenhum projeto deste repositório contém credenciais reais. Os arquivos vêm com placeholders (`YOUR_APPLICATION_ID`, `YOUR_CLIENT_TOKEN`) que devem ser substituídos pelos seus próprios valores obtidos em:

https://app.datadoghq.com/rum/application/create

> ⚠️ **Nunca commite tokens ou Application IDs reais.**

---

## 📚 Recursos úteis

- [Documentação oficial do Datadog RUM](https://docs.datadoghq.com/real_user_monitoring/)
- [Browser SDK no GitHub](https://github.com/DataDog/browser-sdk)
- [RUM Explorer](https://app.datadoghq.com/rum/explorer)

---

## 📝 Licença

Conteúdo apenas para fins de estudo.
