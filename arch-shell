#!/bin/bash

# =============================================
# Script : arch-shell
# Description : Gestion des environnements Arch Linux pour ArchimedeOS
# Auteur : Killian Prin-abeil <killian@archimedeos.org>
# Date : $(date +%Y-%m-%d)
# =============================================

set -euo pipefail

ARCHSHELL_DIR="${HOME}/.arch-shell"
ARCHSHELL_STORE="${ARCHSHELL_DIR}/store"
BASE_TEMPLATE="${ARCHSHELL_STORE}/base-template"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

spinner() {
  local pid=$1
  local msg="$2"
  local spinstr='|/-\\'
  local i=0
  tput civis
  while kill -0 $pid 2>/dev/null; do
    i=$(( (i+1) %4 ))
    printf "\r${YELLOW}[*] %s %s${NC}" "${spinstr:$i:1}" "$msg"
    sleep 0.1
  done
  printf "\r${GREEN}[*] %s terminé !${NC}\n" "$msg"
  tput cnorm
}

usage() {
    echo "Usage: $0 init | regen-base | create <env> | -S <env> <pkg...> | enter <env> | delete <env> | list | info <env>"
    exit 1
}

update_env_info() {
    local envname="$1"
    local envdir="${ARCHSHELL_DIR}/${envname}"
    local infofile="${envdir}/.arch-shell-env"
    
    cat > "$infofile" << EOF
{
  "name": "$envname",
  "created": "$(date -Iseconds)",
  "last_used": "$(date -Iseconds)",
  "packages": [],
  "arch": "$(uname -m)"
}
EOF
}

update_last_used() {
    local envname="$1"
    local infofile="${ARCHSHELL_DIR}/${envname}/.arch-shell-env"
    if [ -f "$infofile" ]; then
        if command -v jq >/dev/null 2>&1; then
            jq ".last_used = \"$(date -Iseconds)\"" "$infofile" > "${infofile}.tmp" && mv "${infofile}.tmp" "$infofile"
        else
            sed -i "s/\"last_used\": \"[^\"]*\"/\"last_used\": \"$(date -Iseconds)\"/" "$infofile"
        fi
    fi
}

add_package() {
    local envname="$1"
    local package="$2"
    local infofile="${ARCHSHELL_DIR}/${envname}/.arch-shell-env"
    
    if [ -f "$infofile" ]; then
        if command -v jq >/dev/null 2>&1; then
            jq ".packages += [\"$package\"]" "$infofile" > "${infofile}.tmp" && mv "${infofile}.tmp" "$infofile"
        else
            sed -i "s/\"packages\": \[\([^]]*\)\]/\"packages\": [\1, \"$package\"]/" "$infofile"
        fi
    fi
}

if [ $# -lt 1 ]; then
    usage
fi

case "$1" in
  init)
    mkdir -p "$ARCHSHELL_STORE"
    if [ -d "$BASE_TEMPLATE" ]; then
      echo "Template de base existe déjà. Utilisez 'regen-base' pour le régénérer."
    else
      echo -e "${BLUE}[*] Création du template de base...${NC}"
      (
        sudo mkarchroot "$BASE_TEMPLATE" base > /dev/null 2>&1
      ) &
      spinner $! "Création du template de base"
      echo -e "${GREEN}[*] Template de base créé.${NC}"
    fi
    ;;
  regen-base)
    mkdir -p "$ARCHSHELL_STORE"
    echo -e "${BLUE}[*] Régénération du template de base...${NC}"
    if [ -d "$BASE_TEMPLATE" ]; then
      sudo rm -rf "$BASE_TEMPLATE"
    fi
    (
      sudo mkarchroot "$BASE_TEMPLATE" base > /dev/null 2>&1
    ) &
    spinner $! "Régénération du template de base"
    echo -e "${GREEN}[*] Template de base régénéré.${NC}"
    ;;
  create)
    if [ $# -lt 2 ]; then
      echo "Usage: $0 create <env>"
      exit 1
    fi
    ENVNAME="$2"
    if [ ! -d "$BASE_TEMPLATE" ]; then
      echo "Template de base introuvable. Exécutez d'abord '$0 init'."
      exit 2
    fi
    if [ -d "${ARCHSHELL_DIR}/${ENVNAME}" ]; then
      echo "L'environnement ${ENVNAME} existe déjà."; exit 5;
    fi
    echo -e "${BLUE}[*] Création de l'environnement $ENVNAME à partir du template...${NC}"
    mkdir -p "${ARCHSHELL_DIR}/${ENVNAME}"
    total=$(sudo du -sb "$BASE_TEMPLATE" | awk '{print $1}')
    (
      n=0
      sudo tar cf - -C "$BASE_TEMPLATE" . | \
      sudo tar xf - -C "${ARCHSHELL_DIR}/${ENVNAME}"
    ) 2> >(grep -v 'socket ignorée' >&2) &
    spinner $! "Copie du template"
    sudo chown -R $USER: "${ARCHSHELL_DIR}/${ENVNAME}"
    update_env_info "$ENVNAME"
    echo -e "${GREEN}[*] Environnement $ENVNAME créé.${NC}"
    ;;
  -S)
    if [ $# -lt 3 ]; then
      echo "Usage: $0 -S <env> <pkg...>"
      exit 1
    fi
    ENVNAME="$2"
    shift 2
    if [ ! -d "${ARCHSHELL_DIR}/${ENVNAME}" ]; then
      echo "Environnement inexistant : ${ENVNAME}"; exit 3;
    fi
    echo -e "${BLUE}[*] Installation de(s) paquet(s) $* dans $ENVNAME...${NC}"
    (
      sudo arch-nspawn -c /var/cache/pacman/pkg "${ARCHSHELL_DIR}/${ENVNAME}" pacman -S --noconfirm "$@" > /dev/null 2>&1
    ) &
    spinner $! "Installation des paquets"
    echo -e "${GREEN}[*] Installation terminée.${NC}"
    update_last_used "$ENVNAME"
    for pkg in "$@"; do
      add_package "$ENVNAME" "$pkg"
    done
    ;;
  enter)
    if [ $# -lt 2 ]; then
      echo "Usage: $0 enter <env>"
      exit 1
    fi
    ENVNAME="$2"
    if [ ! -d "${ARCHSHELL_DIR}/${ENVNAME}" ]; then
      echo "Environnement inexistant : ${ENVNAME}"; exit 3;
    fi
    echo "Entrée dans l'environnement $ENVNAME."
    update_last_used "$ENVNAME"
    sudo arch-nspawn -c /var/cache/pacman/pkg "${ARCHSHELL_DIR}/${ENVNAME}"
    ;;
  delete)
    if [ $# -lt 2 ]; then
      echo "Usage: $0 delete <env>"
      exit 1
    fi
    ENVNAME="$2"
    if [ ! -d "${ARCHSHELL_DIR}/${ENVNAME}" ]; then
      echo "Environnement inexistant : ${ENVNAME}"; exit 3;
    fi
    read -p "Supprimer définitivement ${ENVNAME} ? [o/N] " REP
    if [[ "$REP" =~ ^[oOyY]$ ]]; then
      sudo rm -rf "${ARCHSHELL_DIR}/${ENVNAME}"
      LOCKFILE="${ARCHSHELL_DIR}/${ENVNAME}.lock"
      if [ -f "$LOCKFILE" ]; then
        sudo rm -f "$LOCKFILE"
      fi
      echo "Environnement supprimé."
    else
      echo "Annulé."
    fi
    ;;
  list)
    echo "Environnements disponibles :"
    for env in "$ARCHSHELL_DIR"/*; do
      [ -d "$env" ] || continue
      [ "$(basename "$env")" = "store" ] && continue
      if [ -f "$env/.arch-shell-env" ]; then
        echo "- $(basename "$env")"
      fi
    done
    ;;
  info)
    if [ $# -lt 2 ]; then
      echo "Usage: $0 info <env>"
      exit 1
    fi
    ENVNAME="$2"
    INFOFILE="${ARCHSHELL_DIR}/${ENVNAME}/.arch-shell-env"
    if [ ! -f "$INFOFILE" ]; then
      echo "Environnement inexistant : ${ENVNAME}"; exit 3;
    fi
    echo "Informations sur l'environnement $ENVNAME :"
    if command -v jq >/dev/null 2>&1; then
      jq '.' "$INFOFILE"
    else
      cat "$INFOFILE"
    fi
    ;;
  *)
    usage
    ;;
esac