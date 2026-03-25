#!/bin/bash
# Script de Configuração e Instalação do Cloudflare WARP Panel

# Cores para o terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}--------------------------------------------------${NC}"
echo -e "${BLUE}   Cloudflare WARP Panel - Assistente de Setup   ${NC}"
echo -e "${BLUE}--------------------------------------------------${NC}"
echo "Selecione o tipo de instalação desejada:"
echo "--------------------------------------------------"
echo -e "1) ${GREEN}USUÁRIO${NC}       - Instala apenas o necessário para rodar o app."
echo -e "2) ${GREEN}DESENVOLVEDOR${NC} - Instala todas as dependências para editar o projeto."
echo "--------------------------------------------------"
read -p "Escolha uma opção (1 ou 2): " OPT

if [ "$OPT" == "1" ]; then
    echo -e "\n${BLUE}[1/2] Instalando componentes de sistema para uso...${NC}"
    # No Arch Linux, as dependências são:
    if command -v pacman &> /dev/null; then
        sudo pacman -S --needed cloudflare-warp-bin gtk3 libadwaita
    elif command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y libgtk-3-dev libadwaita-1-dev
    else
        echo -e "${RED}Gerenciador de pacotes não identificado. Instale manualmente: cloudflare-warp, gtk3, libadwaita.${NC}"
    fi
    echo -e "${GREEN}>>> Pronto! Componentes necessários instalados.${NC}"

elif [ "$OPT" == "2" ]; then
    echo -e "\n${BLUE}[1/3] Configurando ambiente de desenvolvimento...${NC}"
    # No Arch Linux, inclui ferramentas de build e flutter:
    if command -v pacman &> /dev/null; then
        sudo pacman -S --needed cloudflare-warp-bin gtk3 libadwaita git flutter dart
    elif command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y git curl unzip libglu1-mesa libgtk-3-dev libadwaita-1-dev
        echo "Aviso: O Flutter SDK deve ser instalado manualmente ou via snap/tarball no Debian/Ubuntu."
    else
        echo -e "${RED}Gerenciador de pacotes não identificado. Instale Flutter, Dart e Git manualmente.${NC}"
    fi
    
    echo -e "\n${BLUE}[2/3] Baixando dependências do Flutter...${NC}"
    if command -v flutter &> /dev/null; then
        flutter pub get
        flutter gen-l10n
    fi

    echo -e "\n${BLUE}[3/3] Verificando ambiente...${NC}"
    if command -v flutter &> /dev/null; then
        flutter doctor
    fi
    echo -e "${GREEN}>>> Dependências de desenvolvimento instaladas!${NC}"

else
    echo -e "${RED}Opção inválida. Operação cancelada.${NC}"
    exit 1
fi

echo -e "\n${BLUE}Setup concluído com sucesso!${NC}"
