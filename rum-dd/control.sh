#!/bin/bash

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════╗"
echo "║  Datadog RUM - Docker Control Panel  ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Menu
echo -e "${YELLOW}Escolha uma ação:${NC}"
echo ""
echo "1) 🚀 Iniciar (Build + Start)"
echo "2) ⏹️  Parar"
echo "3) 🔄 Reiniciar"
echo "4) 📋 Ver logs"
echo "5) 🗑️  Remover container"
echo "6) 🔍 Status"
echo "7) 🌐 Abrir no navegador"
echo "8) ❌ Sair"
echo ""

read -p "Digite o número da ação: " choice

case $choice in
    1)
        echo -e "${BLUE}🚀 Iniciando container...${NC}"
        docker-compose up --build
        ;;
    2)
        echo -e "${YELLOW}⏹️  Parando container...${NC}"
        docker-compose stop
        echo -e "${GREEN}✅ Parado!${NC}"
        ;;
    3)
        echo -e "${YELLOW}🔄 Reiniciando container...${NC}"
        docker-compose restart
        echo -e "${GREEN}✅ Reiniciado!${NC}"
        ;;
    4)
        echo -e "${BLUE}📋 Mostrando logs...${NC}"
        echo "Pressione CTRL+C para sair"
        docker-compose logs -f
        ;;
    5)
        echo -e "${RED}🗑️  Removendo container...${NC}"
        docker-compose down
        echo -e "${GREEN}✅ Removido!${NC}"
        ;;
    6)
        echo -e "${BLUE}🔍 Status do container:${NC}"
        docker-compose ps
        ;;
    7)
        echo -e "${BLUE}🌐 Abrindo http://localhost:8080${NC}"
        
        # Detectar SO e abrir navegador
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            xdg-open http://localhost:8080 || sensible-browser http://localhost:8080
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            open http://localhost:8080
        elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
            start http://localhost:8080
        else
            echo "Abra manualmente: http://localhost:8080"
        fi
        ;;
    8)
        echo -e "${YELLOW}Até logo! 👋${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}❌ Opção inválida!${NC}"
        exit 1
        ;;
esac