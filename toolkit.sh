#!/usr/bin/env bash

set -uo pipefail

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
TOOLKIT_ROOT="$(cd -P "$(dirname "$SOURCE")" && pwd)"

MEDIA_DIR="$TOOLKIT_ROOT/media"
OPT_DIR="$TOOLKIT_ROOT/optimization"
SEC_DIR="$TOOLKIT_ROOT/security"
PTERO_DIR="$TOOLKIT_ROOT/ptero"

BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m'

show_banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "  ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗"
    echo "  ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝"
    echo "     ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║   "
    echo "     ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║   "
    echo "     ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║   "
    echo "     ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   "
    echo -e "${NC}${DIM}       System Optimization, Security & Media Toolkit${NC}"
    echo -e "${DIM}       Path: ${TOOLKIT_ROOT}${NC}"
    echo ""
}

execute_script() {
    local target="$1"
    local needs_root="${2:-false}"
    local interactive="${3:-false}"
    shift 3 || shift $#

    if [ ! -f "$target" ]; then
        echo -e "${RED}[✗] Target script not found: $target${NC}" >&2
        return 1
    fi

    chmod +x "$target" 2>/dev/null || true

    if [ "$needs_root" = "true" ] && [ "${EUID:-$(id -u)}" -ne 0 ]; then
        echo -e "${YELLOW}[!] This action requires root privileges.${NC}"
        if command -v sudo &>/dev/null; then
            echo -e "${CYAN}[+] Elevating via sudo...${NC}"
            sudo bash "$target" "$@"
        else
            echo -e "${RED}[✗] 'sudo' not available. Please run this command as root.${NC}" >&2
            return 1
        fi
    else
        bash "$target" "$@"
    fi
    local exit_code=$?

    if [ "$interactive" = "true" ]; then
        echo ""
        echo -e "${DIM}-------------------------------------------------------${NC}"
        read -rp "Press [Enter] to return to menu..."
    fi

    return $exit_code
}

menu_optimization() {
    while true; do
        show_banner
        echo -e "${YELLOW}${BOLD}=== System Optimization ===${NC}"
        echo -e "  ${GREEN}1)${NC} Full Supertune ${DIM}(Network, VM & CPU low-latency tuning)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}2)${NC} TCP & BBR Tune ${DIM}(Network buffer & congestion tuning)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}3)${NC} Install SCX Schedulers & Loader ${DIM}(sched_ext)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}4)${NC} Run SCX P2DQ Scheduler ${DIM}(low-latency gaming/server scheduler)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}5)${NC} Setup 2MB Hugepages ${DIM}(JVM/Minecraft optimization)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}6)${NC} Install Psycachy Kernel ${DIM}(Debian/Ubuntu only)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}7)${NC} Undo Supertune ${DIM}(revert tuning to system defaults)${NC} ${RED}[root]${NC}"
        echo -e "  ${BLUE}0)${NC} Back to Main Menu"
        echo ""
        read -rp "Select an option [0-7]: " opt_choice

        case $opt_choice in
            1) execute_script "$OPT_DIR/supertune.sh" true true ;;
            2) execute_script "$OPT_DIR/tcptune.sh" true true ;;
            3) execute_script "$OPT_DIR/installscx.sh" true true ;;
            4) execute_script "$OPT_DIR/run_p2dq.sh" true true ;;
            5) execute_script "$OPT_DIR/setup-hugepages.sh" true true ;;
            6) execute_script "$OPT_DIR/install_psycachy.sh" true true ;;
            7) execute_script "$OPT_DIR/undosupertune.sh" true true ;;
            0|q|Q) break ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
}

menu_security() {
    while true; do
        show_banner
        echo -e "${MAGENTA}${BOLD}=== Security & Auditing ===${NC}"
        echo -e "  ${GREEN}1)${NC} Run Full Security Audit ${DIM}(Comprehensive audit of all vectors)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}2)${NC} Audit Malware & Cryptominers ${DIM}(Memory, temp dirs & Docker)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}3)${NC} Audit Network Listeners ${DIM}(Open ports, promiscuous interfaces)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}4)${NC} Audit System & SUID ${DIM}(Rootkits, cron jobs & permissions)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}5)${NC} Audit NPM / Node Vulnerabilities ${DIM}(Host & container package scan)${NC}"
        echo -e "  ${BLUE}0)${NC} Back to Main Menu"
        echo ""
        read -rp "Select an option [0-5]: " sec_choice

        case $sec_choice in
            1) execute_script "$SEC_DIR/audit_all.sh" true true ;;
            2) execute_script "$SEC_DIR/audit_malware.sh" true true ;;
            3) execute_script "$SEC_DIR/audit_network.sh" true true ;;
            4) execute_script "$SEC_DIR/audit_system.sh" true true ;;
            5) execute_script "$SEC_DIR/npm_vulnerability_audit.sh" false true ;;
            0|q|Q) break ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
}

menu_ptero() {
    while true; do
        show_banner
        echo -e "${CYAN}${BOLD}=== Pterodactyl Tools ===${NC}"
        echo -e "  ${GREEN}1)${NC} Prep System & Install Wings ${DIM}(Base deps & sysctl tune)${NC} ${RED}[root]${NC}"
        echo -e "  ${GREEN}2)${NC} Wings Diagnostic & Debugger ${DIM}(Inspect logs & error detection)${NC} ${RED}[root]${NC}"
        echo -e "  ${BLUE}0)${NC} Back to Main Menu"
        echo ""
        read -rp "Select an option [0-2]: " ptero_choice

        case $ptero_choice in
            1) execute_script "$PTERO_DIR/install.sh" true true ;;
            2) execute_script "$PTERO_DIR/debug.sh" true true ;;
            0|q|Q) break ;;
            *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
        esac
    done
}

main_menu() {
    while true; do
        show_banner
        echo -e "${BOLD}Select a Category:${NC}"
        echo -e "  ${GREEN}1)${NC} Media Downloader ${DIM}(Interactive yt-dlp & ffmpeg tool)${NC}"
        echo -e "  ${GREEN}2)${NC} System Optimization ${DIM}(Supertune, TCP, SCX, Hugepages)${NC}"
        echo -e "  ${GREEN}3)${NC} Security & Auditing ${DIM}(Malware, Network, SUID, NPM audits)${NC}"
        echo -e "  ${GREEN}4)${NC} Pterodactyl Tools ${DIM}(Wings install prep & debugger)${NC}"
        echo -e "  ${RED}0)${NC} Exit"
        echo ""
        read -rp "Select an option [0-4]: " main_choice

        case $main_choice in
            1)
                execute_script "$MEDIA_DIR/media.sh" false false "--from-toolkit"
                ;;
            2)
                menu_optimization
                ;;
            3)
                menu_security
                ;;
            4)
                menu_ptero
                ;;
            0|q|Q|exit)
                echo -e "\n${CYAN}Goodbye!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option!${NC}"
                sleep 1
                ;;
        esac
    done
}

show_help() {
    echo -e "${BOLD}Toolkit CLI${NC} - Fast execution for system tools"
    echo ""
    echo -e "${BOLD}Usage:${NC}"
    echo "  ./toolkit.sh                     Launch interactive TUI menu"
    echo "  ./toolkit.sh media               Launch media downloader"
    echo "  ./toolkit.sh optimize <action>   Run optimization script"
    echo "  ./toolkit.sh security <action>   Run security audit script"
    echo "  ./toolkit.sh ptero <action>      Run Pterodactyl tool"
    echo "  ./toolkit.sh help                Show this help screen"
    echo ""
    echo -e "${BOLD}Optimization actions:${NC}"
    echo "  supertune    - Full low-latency system tuning (Network, VM, CPU)"
    echo "  tcptune      - TCP & BBR network buffer tuning only"
    echo "  scx          - Install SCX schedulers & loader"
    echo "  p2dq         - Run SCX P2DQ scheduler in screen session"
    echo "  hugepages    - Pre-allocate 2MB huge pages"
    echo "  psycachy     - Install custom Psycachy kernel (Debian/Ubuntu)"
    echo "  undo         - Revert supertune optimizations"
    echo ""
    echo -e "${BOLD}Security actions:${NC}"
    echo "  all          - Run full comprehensive system audit"
    echo "  malware      - Audit malware, cryptominers & memory"
    echo "  network      - Audit network listeners & promiscuous interfaces"
    echo "  system       - Audit SUID binaries, cron & shell persistence"
    echo "  npm          - Audit Node & NPM vulnerabilities"
    echo ""
    echo -e "${BOLD}Pterodactyl actions:${NC}"
    echo "  install      - Apply base optimizations and prep for Wings install"
    echo "  debug        - Run Wings debugger, inspect logs & common issues"
    echo ""
}

if [ $# -eq 0 ]; then
    main_menu
else
    COMMAND="$1"
    shift

    case "$COMMAND" in
        menu)
            main_menu
            ;;
        media)
            execute_script "$MEDIA_DIR/media.sh" false false "$@"
            ;;
        optimize|opt)
            ACTION="${1:-}"
            shift || true
            case "$ACTION" in
                supertune) execute_script "$OPT_DIR/supertune.sh" true false "$@" ;;
                tcptune) execute_script "$OPT_DIR/tcptune.sh" true false "$@" ;;
                scx) execute_script "$OPT_DIR/installscx.sh" true false "$@" ;;
                p2dq) execute_script "$OPT_DIR/run_p2dq.sh" true false "$@" ;;
                hugepages) execute_script "$OPT_DIR/setup-hugepages.sh" true false "$@" ;;
                psycachy) execute_script "$OPT_DIR/install_psycachy.sh" true false "$@" ;;
                undo) execute_script "$OPT_DIR/undosupertune.sh" true false "$@" ;;
                *)
                    echo -e "${RED}[✗] Unknown optimization action: '$ACTION'${NC}"
                    echo "Available actions: supertune, tcptune, scx, p2dq, hugepages, psycachy, undo"
                    exit 1
                    ;;
            esac
            ;;
        security|sec)
            ACTION="${1:-}"
            shift || true
            case "$ACTION" in
                all) execute_script "$SEC_DIR/audit_all.sh" true false "$@" ;;
                malware) execute_script "$SEC_DIR/audit_malware.sh" true false "$@" ;;
                network) execute_script "$SEC_DIR/audit_network.sh" true false "$@" ;;
                system) execute_script "$SEC_DIR/audit_system.sh" true false "$@" ;;
                npm) execute_script "$SEC_DIR/npm_vulnerability_audit.sh" false false "$@" ;;
                *)
                    echo -e "${RED}[✗] Unknown security action: '$ACTION'${NC}"
                    echo "Available actions: all, malware, network, system, npm"
                    exit 1
                    ;;
            esac
            ;;
        ptero)
            ACTION="${1:-}"
            shift || true
            case "$ACTION" in
                install) execute_script "$PTERO_DIR/install.sh" true false "$@" ;;
                debug) execute_script "$PTERO_DIR/debug.sh" true false "$@" ;;
                *)
                    echo -e "${RED}[✗] Unknown pterodactyl action: '$ACTION'${NC}"
                    echo "Available actions: install, debug"
                    exit 1
                    ;;
            esac
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            echo -e "${RED}[✗] Unknown command: '$COMMAND'${NC}"
            echo "Run './toolkit.sh help' for usage instructions."
            exit 1
            ;;
    esac
fi
