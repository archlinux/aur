#!/usr/bin/env bash
# hyprbole - a Hyprland config manager
# hi there

FIXES=7 # add +1 whenever you've successfully found a bug and fxed it
for _arg in "$@"; do
    [[ "$_arg" == "--fixes" ]] && { printf "successful bug fixes: %d\n" "$FIXES"; exit 0; }
done

DEBUG=0
DEBUG_LOG="/tmp/hyprbole-debug.log"
for _arg in "$@"; do [[ "$_arg" == "--debug" ]] && DEBUG=1; done

dbg()     { [[ $DEBUG -eq 0 ]] && return; printf '[%s] %s\n' "$(date +%T.%3N)" "$*" >> "$DEBUG_LOG"; }
dbg_key() {
    [[ $DEBUG -eq 0 ]] && return
    local hex; hex=$(printf '%s' "$2" | od -An -tx1 | tr -d ' \n')
    printf '[%s] KEY %-22s hex=%-12s repr=%q\n' "$(date +%T.%3N)" "$1" "$hex" "$2" >> "$DEBUG_LOG"
}

HYPR_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/hypr"
HYPR_CONF="$HYPR_DIR/hyprland.conf"
MANAGED_CONF="$HYPR_DIR/hyprbole-managed.conf"
BACKUP_DIR="$HYPR_DIR/hyprbole-backups"

R="\033[0m"  BOLD="\033[1m"  DIM="\033[2m"  ITAL="\033[3m"
ACC="\033[38;2;255;176;0m"
WHITE="\033[38;2;230;230;230m"
MUTED="\033[38;2;100;100;100m"
RED="\033[38;2;220;60;60m"
GRN="\033[38;2;80;200;100m"
CYN="\033[38;2;60;180;200m"
BG_SEL="\033[48;2;40;40;40m"

PICKED_IDX=0; PICKED_VAL=""; PICK_ACTION=""; PSEL_RESULT=""
CANCELLED=0; INPUT_RESULT=""; PSEL_LINES=1

COLS=$(tput cols 2>/dev/null || echo 80)
LINES_T=$(tput lines 2>/dev/null || echo 24)

_hide_cursor() { printf '\033[?25l'; }
_show_cursor() { printf '\033[?25h'; }
_clear()       { printf '\033[2J\033[H'; }
_smcup()       { tput smcup 2>/dev/null || true; }
_rmcup()       { tput rmcup 2>/dev/null || true; }

_cleanup() { _rmcup; _show_cursor; printf "\n${MUTED}  hyprbole done.${R}\n"; }
trap _cleanup EXIT INT TERM

draw_header() {
    local title="$1" sub="${2:-}"
    local crumb="${sub:+$title / $sub}${sub:-$title}"
    local pad=$(( COLS - 10 - ${#crumb} ))
    (( pad < 1 )) && pad=1
    _clear
    printf "${ACC}${BOLD}  hyprbole${R}%${pad}s${MUTED}${crumb}  ${R}\n" ""
    printf "${MUTED}"; printf '─%.0s' $(seq 1 "$COLS"); printf "${R}\n\n"
}

draw_footer() {
    printf "\n${MUTED}"; printf '─%.0s' $(seq 1 "$COLS"); printf "${R}\n"
    printf "${MUTED}  ↑↓ move  enter edit  n add  d del  q back${R}\n"
}

# config

init_config() {
    mkdir -p "$HYPR_DIR"
    if [[ ! -f "$MANAGED_CONF" ]]; then
        cat > "$MANAGED_CONF" <<'EOF'
# hyprbole-managed.conf

# [KEYBINDS]
# [/KEYBINDS]

# [WORKSPACES]
# [/WORKSPACES]

# [WINDOWRULES]
# [/WINDOWRULES]

# [MONITORS]
# [/MONITORS]

# [GENERAL]
# [/GENERAL]

# [DECORATION]
# [/DECORATION]

# [ANIMATIONS]
# [/ANIMATIONS]

# [INPUT]
# [/INPUT]

# [MISC]
# [/MISC]

# [EXEC]
# [/EXEC]

# [ENV]
# [/ENV]
EOF
    fi
    if [[ -f "$HYPR_CONF" ]] && ! grep -q "hyprbole-managed" "$HYPR_CONF" 2>/dev/null; then
        printf "\nsource = %s\n" "$MANAGED_CONF" >> "$HYPR_CONF"
    fi
}

make_backup() {
    mkdir -p "$BACKUP_DIR"
    local ts; ts=$(date +%Y%m%d_%H%M%S)
    [[ -f "$MANAGED_CONF" ]] && cp "$MANAGED_CONF" "$BACKUP_DIR/backup_${ts}.conf"
}

read_section() {
    awk "/^# \[$1\]/{f=1;next} /^# \[\/$1\]/{f=0} f && /[^[:space:]]/" \
        "$MANAGED_CONF" 2>/dev/null || true
}

write_section() {
    local sec="$1" content="$2" inside=0
    local tmp; tmp=$(mktemp)
    while IFS= read -r line; do
        if [[ "$line" == "# [$sec]" ]]; then
            printf '%s\n' "$line" >> "$tmp"
            [[ -n "$content" ]] && printf '%s\n' "$content" >> "$tmp"
            inside=1
        elif [[ "$line" == "# [/$sec]" ]]; then
            inside=0; printf '%s\n' "$line" >> "$tmp"
        elif [[ $inside -eq 0 ]]; then
            printf '%s\n' "$line" >> "$tmp"
        fi
    done < "$MANAGED_CONF"
    mv "$tmp" "$MANAGED_CONF"
}

append_to_section() {
    local cur; cur=$(read_section "$1")
    [[ -z "$cur" ]] && write_section "$1" "$2" || write_section "$1" "$cur
$2"
}

delete_from_section() {
    local cur; cur=$(read_section "$1")
    write_section "$1" "$(printf '%s\n' "$cur" | grep -Fxv "$2" || true)"
}

msg_ok()     { printf "\n  ${GRN}+${R}  ${WHITE}%s${R}\n" "$*"; sleep 1; }
msg_err()    { printf "\n  ${RED}!${R}  ${WHITE}%s${R}\n" "$*"; sleep 1.5; }
msg_cancel() { printf "\n  ${MUTED}cancelled.${R}\n"; sleep 0.4; }
cancelled()  { [[ $CANCELLED -eq 1 ]]; }

flush_stdin() {
    local _j _n=0
    # 100ms timeout, long enough to catch rapid key spam
    while IFS= read -rsn1 -t 0.1 _j 2>/dev/null < /dev/tty; do
        dbg_key "flush[$_n]" "$_j"; (( _n++ ))
    done
    dbg "flush drained $_n"
}

# pick_list
# sets PICK_ACTION, PICKED_IDX, PICKED_VAL
pick_list() {
    local title="$1"; shift
    local subtitle="$1"; shift
    local items=("$@") count=${#items[@]} sel=0 offset=0
    local visible=$(( LINES_T - 11 ))
    (( visible < 3 )) && visible=3
    _hide_cursor
    while true; do
        draw_header "$title" "$subtitle"
        [[ $count -eq 0 ]] && printf "\n  ${MUTED}(empty — press n)${R}\n"
        (( sel < 0 )) && sel=0
        (( count > 0 && sel >= count )) && sel=$(( count-1 ))
        (( sel < offset )) && offset=$sel
        (( sel >= offset+visible )) && offset=$(( sel-visible+1 ))
        local end=$(( offset+visible ))
        (( end > count )) && end=$count
        local i
        for (( i=offset; i<end; i++ )); do
            if (( i == sel )); then
                printf "${BG_SEL}${ACC}${BOLD}  ❯  ${WHITE}%-$((COLS-7))s${R}\n" "${items[$i]}"
            else
                printf "${MUTED}     ${WHITE}%-$((COLS-7))s${R}\n" "${items[$i]}"
            fi
        done
        (( count > visible )) && printf "\n${MUTED}  %d–%d / %d${R}\n" $((offset+1)) "$end" "$count"
        draw_footer
        local k1="" k2="" k3=""
        IFS= read -rsn1 k1 < /dev/tty
        dbg_key "pick/k1" "$k1"
        if [[ "$k1" == $'\x1b' ]]; then
            IFS= read -rsn1 -t 0.15 k2 < /dev/tty || k2=""
            if [[ "$k2" == "[" ]]; then
                IFS= read -rsn1 -t 0.15 k3 < /dev/tty || k3=""
                case "$k3" in
                    A) (( sel > 0 ))       && (( sel-- )); continue ;;
                    B) (( sel < count-1 )) && (( sel++ )); continue ;;
                    *) continue ;;
                esac
            elif [[ -z "$k2" ]]; then
                flush_stdin; _show_cursor; PICK_ACTION="quit"; return
            else
                continue
            fi
        fi
        case "$k1" in
            k|K) (( sel > 0 ))       && (( sel-- )) ;;
            j|J) (( sel < count-1 )) && (( sel++ )) ;;
            " "|"")
                if (( count > 0 )); then
                    PICKED_IDX=$sel; PICKED_VAL="${items[$sel]}"
                    flush_stdin; _show_cursor; PICK_ACTION="select"; return
                fi ;;
            n|N) flush_stdin; _show_cursor; PICK_ACTION="new";    return ;;
            d|D)
                if (( count > 0 )); then
                    PICKED_IDX=$sel; PICKED_VAL="${items[$sel]}"
                    flush_stdin; _show_cursor; PICK_ACTION="delete"; return
                fi ;;
            q|Q) flush_stdin; _show_cursor; PICK_ACTION="quit"; return ;;
        esac
    done
}

# prompt input
# NEVER call inside $() — sets INPUT_RESULT and CANCELLED directly, otherwise you're gonna get TONS of errors!
# usage:
#   prompt_input "label" "default"
#   cancelled && { msg_cancel; return; }
#   val="$INPUT_RESULT"
prompt_input() {
    local label="$1" default="${2:-}"
    CANCELLED=0; INPUT_RESULT=""
    flush_stdin
    {
        printf '\033[?25h'
        printf "  ${MUTED}>${R}  ${WHITE}${BOLD}%s${R}" "$label"
        [[ -n "$default" ]] && printf "  ${MUTED}[%s]${R}" "$default"
        printf "  ${MUTED}ctrl+q cancel${R}  ${ACC}›${R} "
    } > /dev/tty
    local char acc=""
    while true; do
        IFS= read -rsn1 char < /dev/tty
        local hex; hex=$(printf '%s' "$char" | od -An -tx1 | tr -d ' \n')
        case "$hex" in
            "03"|"11")
                CANCELLED=1
                printf '\n' > /dev/tty
                sleep 0.15   # let tty buffer settle before flush
                flush_stdin
                return ;;
            "1b")
                local e2; IFS= read -rsn1 -t 0.1 e2 < /dev/tty || e2=""
                if [[ -z "$e2" ]]; then
                    CANCELLED=1; printf '\n' > /dev/tty; sleep 0.15; flush_stdin; return
                fi
                IFS= read -rsn1 -t 0.1 < /dev/tty || true ;;
            "0d"|"0a"|"") printf '\n' > /dev/tty; break ;;
            "7f"|"08") [[ -n "$acc" ]] && { acc="${acc%?}"; printf '\b \b' > /dev/tty; } ;;
            *) acc+="$char"; printf '%s' "$char" > /dev/tty ;;
        esac
    done
    [[ -z "$acc" && -n "$default" ]] && acc="$default"
    INPUT_RESULT="$acc"
}

# prompt select
# sets PSEL_RESULT and CANCELLED
prompt_select() {
    local label="$1"; shift
    local opts=("$@") sel=0

    _render_psel() {
        local cols; cols=$(tput cols)
        local i

        # jump back to saved cursor position and clear from there to end of screen
        printf '\033[u\033[J' > /dev/tty

        printf "  ${MUTED}>${R}  ${WHITE}${BOLD}%s${R}  " "$label" > /dev/tty
        local line_len=$(( ${#label} + 7 ))

        for (( i=0; i<${#opts[@]}; i++ )); do
            local opt_len=$(( ${#opts[$i]} + 3 ))
            if (( line_len + opt_len > cols )); then
                printf '\n    ' > /dev/tty
                line_len=4
            fi
            (( i==sel )) \
                && printf "${BG_SEL}${ACC}${BOLD} %s ${R}  " "${opts[$i]}" > /dev/tty \
                || printf "${MUTED} %s ${R}  " "${opts[$i]}" > /dev/tty
            line_len=$(( line_len + opt_len ))
        done
        printf "\n${MUTED}  ←/→  ctrl+q${R}" > /dev/tty
    }

    printf '\033[?25l' > /dev/tty
    printf '\033[s' > /dev/tty   # save cursor position once
    CANCELLED=0; _render_psel
    while true; do
        local k1="" k2="" k3=""
        IFS= read -rsn1 k1 < /dev/tty
        local k1hex; k1hex=$(printf '%s' "$k1" | od -An -tx1 | tr -d ' \n')
        if [[ "$k1hex" == "03" || "$k1hex" == "11" ]]; then
            { printf '\r\033[2K'; printf '\033[?25h'; } > /dev/tty
            flush_stdin; CANCELLED=1; PSEL_RESULT=""; return
        fi
        if [[ "$k1" == $'\x1b' ]]; then
            IFS= read -rsn1 -t 0.15 k2 < /dev/tty || k2=""
            if [[ "$k2" == "[" ]]; then
                IFS= read -rsn1 -t 0.15 k3 < /dev/tty || k3=""
                case "$k3" in
                    C) (( sel < ${#opts[@]}-1 )) && (( sel++ )); _render_psel ;;
                    D) (( sel > 0 ))             && (( sel-- )); _render_psel ;;
                esac
            elif [[ -z "$k2" ]]; then
                { printf '\r\033[2K'; printf '\033[?25h'; } > /dev/tty
                flush_stdin; CANCELLED=1; PSEL_RESULT=""; return
            fi
            flush_stdin
        else
            case "$k1" in
                ""|" ")
                    { printf '\r\033[2K'; printf '\033[?25h'; } > /dev/tty
                    flush_stdin; PSEL_RESULT="${opts[$sel]}"; return ;;
                h|H) (( sel > 0 ))             && (( sel-- )); _render_psel ;;
                l|L) (( sel < ${#opts[@]}-1 )) && (( sel++ )); _render_psel ;;
            esac
        fi
    done
}

# helper: prompt_input then immediately check cancel
# usage:  pinput VAR "label" "default" || return
# (can't use in subshell so we use this wrapper pattern inline)

edit_line() {
    local section="$1" old="$2"
    draw_header "$section" "edit"
    printf "\n  ${MUTED}%s${R}\n\n" "$old"
    prompt_input "new value" "$old"; printf "\n"
    cancelled && { msg_cancel; return; }
    local new="$INPUT_RESULT"
    [[ -z "$new" || "$new" == "$old" ]] && return
    make_backup
    delete_from_section "$section" "$old"
    append_to_section   "$section" "$new"
    msg_ok "Updated."
}

declare -A FIELD_RESULTS
declare -A FIELD_DRAFTS
FIELDS_SAVED=0

edit_fields_tui() {
    local section="$1" title="$2"
    local -n _fnames="$3"
    local -n _fdefs="$4"
    local count=${#_fnames[@]}
    local sel=0
    FIELDS_SAVED=0

    local i
    for (( i=0; i<count; i++ )); do
        FIELD_DRAFTS["${_fnames[$i]}"]="${_fdefs[$i]}"
    done

    _draw_field_editor() {
        draw_header "$title" "edit fields"
        printf "  ${MUTED}q save  ctrl+q discard  ↑↓ navigate  enter edit${R}\n\n"
        local j
        for (( j=0; j<count; j++ )); do
            local fname="${_fnames[$j]}"
            local fval="${FIELD_DRAFTS[$fname]}"
            if (( j == sel )); then
                printf "${BG_SEL}${ACC}${BOLD}  ❯  ${WHITE}%-25s${MUTED} = ${ACC}%s${R}\n" "$fname" "$fval"
            else
                printf "${MUTED}     ${WHITE}%-25s${MUTED} = ${WHITE}%s${R}\n" "$fname" "$fval"
            fi
        done
        printf "\n${MUTED}"; printf '─%.0s' $(seq 1 "$COLS"); printf "${R}\n"
        printf "${MUTED}  q save  ctrl+q discard${R}\n"
    }

    _hide_cursor
    while true; do
        _draw_field_editor
        local k1="" k2="" k3=""
        IFS= read -rsn1 k1 < /dev/tty
        local k1hex; k1hex=$(printf '%s' "$k1" | od -An -tx1 | tr -d ' \n')

        if [[ "$k1hex" == "03" || "$k1hex" == "11" ]]; then
            flush_stdin; _show_cursor; FIELDS_SAVED=0; return
        fi

        if [[ "$k1" == $'\x1b' ]]; then
            IFS= read -rsn1 -t 0.15 k2 < /dev/tty || k2=""
            if [[ "$k2" == "[" ]]; then
                IFS= read -rsn1 -t 0.15 k3 < /dev/tty || k3=""
                case "$k3" in
                    A) (( sel > 0 )) && (( sel-- )) ;;
                    B) (( sel < count-1 )) && (( sel++ )) ;;
                esac
            elif [[ -z "$k2" ]]; then
                flush_stdin; _show_cursor; FIELDS_SAVED=0; return
            fi
            continue
        fi

        case "$k1" in
            k|K) (( sel > 0 )) && (( sel-- )) ;;
            j|J) (( sel < count-1 )) && (( sel++ )) ;;
            q|Q)
                flush_stdin; _show_cursor; FIELDS_SAVED=1
                for (( i=0; i<count; i++ )); do
                    FIELD_RESULTS["${_fnames[$i]}"]="${FIELD_DRAFTS[${_fnames[$i]}]}"
                done
                return ;;
            ""|" ")
                local fname="${_fnames[$sel]}"
                _show_cursor
                draw_header "$title" "edit / $fname"
                printf "\n"
                prompt_input "$fname" "${FIELD_DRAFTS[$fname]}"; printf "\n"
                if ! cancelled; then
                    FIELD_DRAFTS["$fname"]="$INPUT_RESULT"
                fi
                _hide_cursor
                ;;
        esac
    done
}

section_add_custom() {
    local -a sections=("KEYBINDS" "MONITORS" "WORKSPACES" "WINDOWRULES" "GENERAL" "DECORATION" "ANIMATIONS" "INPUT" "MISC" "EXEC" "ENV")
    draw_header "add custom line" "pick section"
    printf "\n"
    prompt_select "Section" "${sections[@]}"
    cancelled && { msg_cancel; return; }
    local sec="$PSEL_RESULT"; printf "\n\n"

    draw_header "add custom line" "$sec"
    printf "\n  ${MUTED}raw line will be added as-is${R}\n\n"
    prompt_input "line"; printf "\n"
    cancelled && { msg_cancel; return; }
    local line="$INPUT_RESULT"
    [[ -z "$line" ]] && { msg_err "line cannot be empty."; return; }
    make_backup
    append_to_section "$sec" "$line"
    msg_ok "Added to $sec."
}

open_files_menu() {
    local editor=""
    if command -v yazi &>/dev/null; then editor="yazi"
    elif command -v nvim &>/dev/null; then editor="nvim"
    elif command -v vim &>/dev/null; then editor="vim"
    elif command -v nano &>/dev/null; then editor="nano"
    fi

    while true; do
        local -a menu=("view hyprland.conf" "view hyprbole-managed.conf")
        [[ -n "$editor" ]] && menu+=("open hyprland.conf in $editor" "open hyprbole-managed.conf in $editor")
        menu+=("back")

        pick_list "FILES" "$HYPR_DIR" "${menu[@]}"
        case "$PICK_ACTION" in
            quit) return ;;
            select)
                case "$PICKED_VAL" in
                    "view hyprland.conf")           _view_file "$HYPR_CONF" "hyprland.conf" ;;
                    "view hyprbole-managed.conf")   _view_file "$MANAGED_CONF" "hyprbole-managed.conf" ;;
                    "open hyprland.conf in $editor")
                        _rmcup; _show_cursor
                        $editor "$HYPR_CONF"
                        _smcup; _hide_cursor ;;
                    "open hyprbole-managed.conf in $editor")
                        _rmcup; _show_cursor
                        $editor "$MANAGED_CONF"
                        _smcup; _hide_cursor ;;
                    "back") return ;;
                esac ;;
        esac
    done
}

_view_file() {
    local path="$1" name="$2"
    draw_header "view" "$name"
    printf "\n"
    local n=1
    while IFS= read -r line; do
        printf "  ${MUTED}%3d${R}  ${WHITE}%s${R}\n" $n "$line"; (( n++ ))
    done < "$path"
    printf "\n${MUTED}  press any key...${R}"; IFS= read -rsn1 < /dev/tty
}


# keybinds

section_keybinds() {
    while true; do
        local -a items; mapfile -t items < <(read_section "KEYBINDS")
        pick_list "KEYBINDS" "bind = MOD, KEY, dispatcher, args" "${items[@]}"
        case "$PICK_ACTION" in
            quit)   return ;;
            new)    add_keybind ;;
            delete) make_backup; delete_from_section "KEYBINDS" "$PICKED_VAL"; msg_ok "Removed." ;;
            select) edit_keybind "$PICKED_VAL" ;;
        esac
    done
}

add_keybind() {
    draw_header "KEYBINDS" "add"
    printf "\n"
    prompt_select "Modifier" "SUPER" "SUPER SHIFT" "SUPER CTRL" "SUPER ALT" "ALT" "CTRL SHIFT" "none"
    cancelled && { msg_cancel; return; }
    local mod="$PSEL_RESULT"; [[ "$mod" == "none" ]] && mod=""
    printf "\n\n"

    prompt_input "Key (e.g. Return, h, grave, F11)"; printf "\n"
    cancelled && { msg_cancel; return; }
    local key="$INPUT_RESULT"
    [[ -z "$key" ]] && { msg_err "Key cannot be empty."; return; }

    prompt_select "Dispatcher" "exec" "killactive" "togglefloating" "fullscreen" "workspace" "movetoworkspace" "movefocus" "togglespecialworkspace" "resizeactive" "exit"
    cancelled && { msg_cancel; return; }
    local dispatcher="$PSEL_RESULT"; printf "\n\n"

    prompt_input "Args / command (blank if none)"; printf "\n"
    cancelled && { msg_cancel; return; }
    local args="$INPUT_RESULT"

    local line="bind = $mod, $key, $dispatcher, $args"
    make_backup; append_to_section "KEYBINDS" "$line"
    msg_ok "Added: $line"
}

edit_keybind() {
    local old="$1"
    # parse: bind = MOD, KEY, DISPATCHER, ARGS
    local rest="${old#*= }"
    local mod;        mod=$(cut -d',' -f1 <<< "$rest" | xargs)
    local key;        key=$(cut -d',' -f2 <<< "$rest" | xargs)
    local dispatcher; dispatcher=$(cut -d',' -f3 <<< "$rest" | xargs)
    local args;       args=$(cut -d',' -f4- <<< "$rest" | xargs)

    local -a fnames=(modifier key dispatcher args)
    local -a fdefs=("$mod" "$key" "$dispatcher" "$args")

    edit_fields_tui "KEYBINDS" "KEYBINDS" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    local new="bind = ${FIELD_RESULTS[modifier]}, ${FIELD_RESULTS[key]}, ${FIELD_RESULTS[dispatcher]}, ${FIELD_RESULTS[args]}"
    [[ "$new" == "$old" ]] && return
    make_backup
    delete_from_section "KEYBINDS" "$old"
    append_to_section "KEYBINDS" "$new"
    msg_ok "Updated."
}

# monitors

section_monitors() {
    while true; do
        local -a items; mapfile -t items < <(read_section "MONITORS")
        pick_list "MONITORS" "monitor = name, res@hz, position, scale" "${items[@]}"
        case "$PICK_ACTION" in
            quit)   return ;;
            new)    add_monitor ;;
            delete) make_backup; delete_from_section "MONITORS" "$PICKED_VAL"; msg_ok "Removed." ;;
            select) edit_monitor "$PICKED_VAL" ;;
        esac
    done
}

edit_monitor() {
    local old="$1"
    local rest="${old#*= }"
    local name; name=$(cut -d',' -f1 <<< "$rest" | xargs)
    local res;  res=$(cut -d',' -f2 <<< "$rest" | xargs)
    local pos;  pos=$(cut -d',' -f3 <<< "$rest" | xargs)
    local scale; scale=$(cut -d',' -f4 <<< "$rest" | xargs)

    local -a fnames=(name resolution position scale)
    local -a fdefs=("$name" "$res" "$pos" "$scale")

    edit_fields_tui "MONITORS" "MONITORS" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    local new="monitor = ${FIELD_RESULTS[name]}, ${FIELD_RESULTS[resolution]}, ${FIELD_RESULTS[position]}, ${FIELD_RESULTS[scale]}"
    [[ "$new" == "$old" ]] && return
    make_backup
    delete_from_section "MONITORS" "$old"
    append_to_section "MONITORS" "$new"
    msg_ok "Updated."
}

add_monitor() {
    draw_header "MONITORS" "add"
    printf "\n  ${MUTED}tip: run 'hyprctl monitors' to see connected displays${R}\n\n"

    prompt_input "Monitor name (e.g. DP-1, eDP-1 — blank = catch-all)"; printf "\n"
    cancelled && { msg_cancel; return; }
    local name="$INPUT_RESULT"; [[ -z "$name" ]] && name=","

    prompt_input "Resolution@Hz" "preferred"; printf "\n"
    cancelled && { msg_cancel; return; }
    local res="$INPUT_RESULT"

    prompt_input "Position (e.g. 0x0, 2560x0)" "auto"; printf "\n"
    cancelled && { msg_cancel; return; }
    local pos="$INPUT_RESULT"

    prompt_input "Scale" "1"; printf "\n"
    cancelled && { msg_cancel; return; }
    local scale="$INPUT_RESULT"

    local line="monitor = $name, $res, $pos, $scale"
    make_backup; append_to_section "MONITORS" "$line"
    msg_ok "Added: $line"
}

# workspaces

section_workspaces() {
    while true; do
        local -a items; mapfile -t items < <(read_section "WORKSPACES")
        pick_list "WORKSPACES" "special / named / persistent" "${items[@]}"
        case "$PICK_ACTION" in
            quit)   return ;;
            new)    add_workspace ;;
            delete) make_backup; delete_from_section "WORKSPACES" "$PICKED_VAL"; msg_ok "Removed." ;;
            select) edit_workspace "$PICKED_VAL" ;;
        esac
    done
}

edit_workspace() {
    local old="$1"
    # workspace = NUM, rules...  or  workspace = special:NAME
    local rest="${old#*= }"
    local num;   num=$(cut -d',' -f1 <<< "$rest" | xargs)
    local rules; rules=$(cut -d',' -f2- <<< "$rest" | xargs)

    local -a fnames=(workspace rules)
    local -a fdefs=("$num" "$rules")

    edit_fields_tui "WORKSPACES" "WORKSPACES" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    local new
    if [[ -n "${FIELD_RESULTS[rules]}" ]]; then
        new="workspace = ${FIELD_RESULTS[workspace]}, ${FIELD_RESULTS[rules]}"
    else
        new="workspace = ${FIELD_RESULTS[workspace]}"
    fi
    [[ "$new" == "$old" ]] && return
    make_backup
    delete_from_section "WORKSPACES" "$old"
    append_to_section "WORKSPACES" "$new"
    msg_ok "Updated."
}

add_workspace() {
    draw_header "WORKSPACES" "add"
    printf "\n"
    prompt_select "Type" "special" "named" "persistent" "rule"
    cancelled && { msg_cancel; return; }
    local wtype="$PSEL_RESULT"; printf "\n\n"

    local line=""
    case "$wtype" in
        special)
            prompt_input "Name (e.g. terminal)"; printf "\n"
            cancelled && { msg_cancel; return; }
            local name="$INPUT_RESULT"
            [[ -z "$name" ]] && { msg_err "Name cannot be empty."; return; }
            make_backup; append_to_section "WORKSPACES" "workspace = special:$name"
            printf "\n  ${ACC}add a toggle keybind? (y/n)${R} "
            local yn; IFS= read -r yn < /dev/tty
            if [[ "$yn" == "y" || "$yn" == "Y" ]]; then
                printf "\n"
                prompt_select "Modifier" "SUPER" "SUPER SHIFT" "ALT"
                cancelled && { msg_cancel; return; }
                local mod="$PSEL_RESULT"; printf "\n\n"
                prompt_input "Key (e.g. grave, t, F12)"; printf "\n"
                cancelled && { msg_cancel; return; }
                local key="$INPUT_RESULT"
                append_to_section "KEYBINDS" "bind = $mod, $key, togglespecialworkspace, $name"
                msg_ok "Special workspace + keybind added."
            else
                msg_ok "Special workspace '$name' added."
            fi
            return ;;
        named)
            prompt_input "Workspace number"; printf "\n"
            cancelled && { msg_cancel; return; }
            local num="$INPUT_RESULT"
            prompt_input "Name"; printf "\n"
            cancelled && { msg_cancel; return; }
            line="workspace = $num, name:$INPUT_RESULT" ;;
        persistent)
            prompt_input "Workspace number"; printf "\n"
            cancelled && { msg_cancel; return; }
            line="workspace = $INPUT_RESULT, persistent:true" ;;
        rule)
            prompt_input "Workspace number"; printf "\n"
            cancelled && { msg_cancel; return; }
            local num="$INPUT_RESULT"
            prompt_input "Rule (e.g. monitor:DP-1)"; printf "\n"
            cancelled && { msg_cancel; return; }
            line="workspace = $num, $INPUT_RESULT" ;;
    esac
    [[ -z "$line" ]] && return
    make_backup; append_to_section "WORKSPACES" "$line"
    msg_ok "Added: $line"
}

# window rules
section_windowrules() {
    while true; do
        local -a items; mapfile -t items < <(read_section "WINDOWRULES")
        pick_list "WINDOWRULES" "windowrulev2 = rule, matcher" "${items[@]}"
        case "$PICK_ACTION" in
            quit)   return ;;
            new)    add_windowrule ;;
            delete) make_backup; delete_from_section "WINDOWRULES" "$PICKED_VAL"; msg_ok "Removed." ;;
            select) edit_windowrule "$PICKED_VAL" ;;
        esac
    done
}

edit_windowrule() {
    local old="$1"
    # windowrulev2 = RULE, MATCHER
    local rest="${old#*= }"
    local rule;    rule=$(cut -d',' -f1 <<< "$rest" | xargs)
    local matcher; matcher=$(cut -d',' -f2- <<< "$rest" | xargs)

    local -a fnames=(rule matcher)
    local -a fdefs=("$rule" "$matcher")

    edit_fields_tui "WINDOWRULES" "WINDOWRULES" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    local new="windowrulev2 = ${FIELD_RESULTS[rule]}, ${FIELD_RESULTS[matcher]}"
    [[ "$new" == "$old" ]] && return
    make_backup
    delete_from_section "WINDOWRULES" "$old"
    append_to_section "WINDOWRULES" "$new"
    msg_ok "Updated."
}

add_windowrule() {
    draw_header "WINDOWRULES" "add"
    printf "\n"
    prompt_select "Rule" "float" "tile" "fullscreen" "maximize" "size" "move" "center" "workspace" "opacity" "pin" "noblur" "nofocus" "animation" "idleinhibit"
    cancelled && { msg_cancel; return; }
    local rule="$PSEL_RESULT"; printf "\n\n"

    local extra=""
    case "$rule" in
        size|move|workspace|opacity|animation|idleinhibit)
            prompt_input "$rule value"; printf "\n"
            cancelled && { msg_cancel; return; }
            extra=" $INPUT_RESULT" ;;
    esac

    prompt_select "Match by" "class" "title" "initialClass" "initialTitle" "xwayland" "floating" "fullscreen"
    cancelled && { msg_cancel; return; }
    local mtype="$PSEL_RESULT"; printf "\n\n"

    prompt_input "Match value (regex, e.g. ^firefox\$)"; printf "\n"
    cancelled && { msg_cancel; return; }
    local mval="$INPUT_RESULT"

    local line="windowrulev2 = ${rule}${extra}, ${mtype}:^(${mval})\$"
    make_backup; append_to_section "WINDOWRULES" "$line"
    msg_ok "Added: $line"
}

# general

section_general() {
    local cur; cur=$(read_section "GENERAL")
    local -a fnames=(gaps_in gaps_out border_size col.active_border col.inactive_border layout)
    local -a fdefs=(5 10 2 "0xff89b4fa" "0xff313244" "dwindle")

    # seed defaults from current config
    local i
    for (( i=0; i<${#fnames[@]}; i++ )); do
        local k="${fnames[$i]}"
        local v; v=$(printf '%s\n' "$cur" | grep -E "^[[:space:]]*${k}[[:space:]]*=" | head -1 | sed 's/.*=[[:space:]]*//' | xargs)
        [[ -n "$v" ]] && fdefs[$i]="$v"
    done

    edit_fields_tui "GENERAL" "GENERAL" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    make_backup
    write_section "GENERAL" "general {
    gaps_in = ${FIELD_RESULTS[gaps_in]}
    gaps_out = ${FIELD_RESULTS[gaps_out]}
    border_size = ${FIELD_RESULTS[border_size]}
    col.active_border = ${FIELD_RESULTS[col.active_border]}
    col.inactive_border = ${FIELD_RESULTS[col.inactive_border]}
    layout = ${FIELD_RESULTS[layout]}
}"
    msg_ok "Saved."
}

# decoration
section_decoration() {
    local cur; cur=$(read_section "DECORATION")
    local -a fnames=(rounding active_opacity inactive_opacity drop_shadow shadow_range col.shadow blur.enabled blur.size blur.passes dim_inactive dim_strength)
    local -a fdefs=(10 1.0 0.95 true 12 "0xee1a1a2e" true 6 3 false 0.5)

    local i
    for (( i=0; i<${#fnames[@]}; i++ )); do
        local k="${fnames[$i]}"
        local v; v=$(printf '%s\n' "$cur" | grep -E "^[[:space:]]*${k//./\.}[[:space:]]*=" | head -1 | sed 's/.*=[[:space:]]*//' | xargs)
        [[ -n "$v" ]] && fdefs[$i]="$v"
    done

    edit_fields_tui "DECORATION" "DECORATION" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    make_backup
    write_section "DECORATION" "decoration {
    rounding = ${FIELD_RESULTS[rounding]}
    active_opacity = ${FIELD_RESULTS[active_opacity]}
    inactive_opacity = ${FIELD_RESULTS[inactive_opacity]}
    drop_shadow = ${FIELD_RESULTS[drop_shadow]}
    shadow_range = ${FIELD_RESULTS[shadow_range]}
    col.shadow = ${FIELD_RESULTS[col.shadow]}
    dim_inactive = ${FIELD_RESULTS[dim_inactive]}
    dim_strength = ${FIELD_RESULTS[dim_strength]}

    blur {
        enabled = ${FIELD_RESULTS[blur.enabled]}
        size = ${FIELD_RESULTS[blur.size]}
        passes = ${FIELD_RESULTS[blur.passes]}
        new_optimizations = true
    }
}"
    msg_ok "Saved."
}

# animations

section_animations() {
    draw_header "ANIMATIONS" "preset or custom bezier"
    printf "\n"
    prompt_select "Preset" "smooth" "snappy" "bouncy" "minimal" "off" "custom"
    cancelled && { msg_cancel; return; }
    local preset="$PSEL_RESULT"; printf "\n\n"

    local inner=""
    case "$preset" in
        smooth)  inner='    enabled = true
    bezier = ease, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, ease
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default' ;;
        snappy)  inner='    enabled = true
    bezier = snap, 0.1, 1, 0.1, 1
    animation = windows, 1, 3, snap
    animation = windowsOut, 1, 3, snap, popin 80%
    animation = fade, 1, 3, snap
    animation = workspaces, 1, 3, snap' ;;
        bouncy)  inner='    enabled = true
    bezier = bounce, 0.68, -0.55, 0.265, 1.55
    animation = windows, 1, 5, bounce
    animation = windowsOut, 1, 5, bounce, popin 80%
    animation = fade, 1, 5, bounce
    animation = workspaces, 1, 4, bounce' ;;
        minimal) inner='    enabled = true
    bezier = linear, 0, 0, 1, 1
    animation = windows, 1, 2, linear
    animation = fade, 1, 2, linear
    animation = workspaces, 1, 2, linear' ;;
        off)     inner='    enabled = false' ;;
        custom)
            prompt_input "bezier (e.g. myBez, 0.05, 0.9, 0.1, 1.05)"; printf "\n"
            cancelled && { msg_cancel; return; }
            local bez="$INPUT_RESULT"
            prompt_input "animation (e.g. windows, 1, 7, myBez)"; printf "\n"
            cancelled && { msg_cancel; return; }
            local anim="$INPUT_RESULT"
            inner="    enabled = true
    bezier = $bez
    animation = $anim" ;;
    esac
    make_backup
    write_section "ANIMATIONS" "animations {
$inner
}"
    msg_ok "Saved ($preset)."
}

# input

section_input() {
    local cur; cur=$(read_section "INPUT")
    local -a fnames=(kb_layout kb_variant kb_options repeat_rate repeat_delay sensitivity accel_profile follow_mouse natural_scroll tap-to-click)
    local -a fdefs=(us "" "" 50 300 0 flat 1 false true)

    local i
    for (( i=0; i<${#fnames[@]}; i++ )); do
        local k="${fnames[$i]}"
        local v; v=$(printf '%s\n' "$cur" | grep -E "^[[:space:]]*${k}[[:space:]]*=" | head -1 | sed 's/.*=[[:space:]]*//' | xargs)
        [[ -n "$v" ]] && fdefs[$i]="$v"
    done

    edit_fields_tui "INPUT" "INPUT" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    make_backup
    write_section "INPUT" "input {
    kb_layout = ${FIELD_RESULTS[kb_layout]}
    kb_variant = ${FIELD_RESULTS[kb_variant]}
    kb_options = ${FIELD_RESULTS[kb_options]}
    repeat_rate = ${FIELD_RESULTS[repeat_rate]}
    repeat_delay = ${FIELD_RESULTS[repeat_delay]}
    sensitivity = ${FIELD_RESULTS[sensitivity]}
    accel_profile = ${FIELD_RESULTS[accel_profile]}
    follow_mouse = ${FIELD_RESULTS[follow_mouse]}

    touchpad {
        natural_scroll = ${FIELD_RESULTS[natural_scroll]}
        tap-to-click = ${FIELD_RESULTS[tap-to-click]}
        drag_lock = false
    }
}"
    msg_ok "Saved."
}

# misc

section_misc() {
    local cur; cur=$(read_section "MISC")
    local -a fnames=(disable_hyprland_logo disable_splash_rendering vrr mouse_moves_enables_dpms animate_manual_resizes)
    local -a fdefs=(true true 0 true false)

    local i
    for (( i=0; i<${#fnames[@]}; i++ )); do
        local k="${fnames[$i]}"
        local v; v=$(printf '%s\n' "$cur" | grep -E "^[[:space:]]*${k}[[:space:]]*=" | head -1 | sed 's/.*=[[:space:]]*//' | xargs)
        [[ -n "$v" ]] && fdefs[$i]="$v"
    done

    edit_fields_tui "MISC" "MISC" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    make_backup
    write_section "MISC" "misc {
    disable_hyprland_logo = ${FIELD_RESULTS[disable_hyprland_logo]}
    disable_splash_rendering = ${FIELD_RESULTS[disable_splash_rendering]}
    vrr = ${FIELD_RESULTS[vrr]}
    mouse_moves_enables_dpms = ${FIELD_RESULTS[mouse_moves_enables_dpms]}
    animate_manual_resizes = ${FIELD_RESULTS[animate_manual_resizes]}
}"
    msg_ok "Saved."
}

# autostart

section_exec() {
    while true; do
        local -a items; mapfile -t items < <(read_section "EXEC")
        pick_list "AUTOSTART" "exec-once / exec" "${items[@]}"
        case "$PICK_ACTION" in
            quit) return ;;
            new)
                draw_header "AUTOSTART" "add"; printf "\n"
                prompt_select "Type" "exec-once" "exec"
                cancelled && { msg_cancel; continue; }
                local etype="$PSEL_RESULT"; printf "\n\n"
                prompt_input "Command"; printf "\n"
                cancelled && { msg_cancel; continue; }
                local cmd="$INPUT_RESULT"
                [[ -z "$cmd" ]] && { msg_err "Command cannot be empty."; continue; }
                make_backup; append_to_section "EXEC" "$etype = $cmd"
                msg_ok "Added: $etype = $cmd" ;;
            delete) make_backup; delete_from_section "EXEC" "$PICKED_VAL"; msg_ok "Removed." ;;
            select) edit_exec "$PICKED_VAL" ;;
        esac
    done
}

# env vars

section_env() {
    while true; do
        local -a items; mapfile -t items < <(read_section "ENV")
        pick_list "ENV VARS" "env = VARIABLE, value" "${items[@]}"
        case "$PICK_ACTION" in
            quit) return ;;
            new)
                draw_header "ENV VARS" "add"
                printf "\n  ${MUTED}e.g. XCURSOR_SIZE, GDK_SCALE, WLR_NO_HARDWARE_CURSORS${R}\n\n"
                prompt_input "Variable name"; printf "\n"
                cancelled && { msg_cancel; continue; }
                local var="$INPUT_RESULT"
                [[ -z "$var" ]] && { msg_err "Name cannot be empty."; continue; }
                prompt_input "Value"; printf "\n"
                cancelled && { msg_cancel; continue; }
                local val="$INPUT_RESULT"
                make_backup; append_to_section "ENV" "env = $var, $val"
                msg_ok "Added: env = $var, $val" ;;
            delete) make_backup; delete_from_section "ENV" "$PICKED_VAL"; msg_ok "Removed." ;;
            select) edit_env "$PICKED_VAL" ;;
        esac
    done
}

edit_exec() {
    local old="$1"
    # exec-once = CMD  or  exec = CMD
    local etype; etype=$(cut -d'=' -f1 <<< "$old" | xargs)
    local cmd;   cmd=$(cut -d'=' -f2- <<< "$old" | xargs)

    local -a fnames=(type command)
    local -a fdefs=("$etype" "$cmd")

    edit_fields_tui "AUTOSTART" "AUTOSTART" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    local new="${FIELD_RESULTS[type]} = ${FIELD_RESULTS[command]}"
    [[ "$new" == "$old" ]] && return
    make_backup
    delete_from_section "EXEC" "$old"
    append_to_section "EXEC" "$new"
    msg_ok "Updated."
}

edit_env() {
    local old="$1"
    # env = VAR, VALUE
    local rest="${old#*= }"
    local var;   var=$(cut -d',' -f1 <<< "$rest" | xargs)
    local val;   val=$(cut -d',' -f2- <<< "$rest" | xargs)

    local -a fnames=(variable value)
    local -a fdefs=("$var" "$val")

    edit_fields_tui "ENV VARS" "ENV VARS" fnames fdefs
    [[ $FIELDS_SAVED -eq 0 ]] && { msg_cancel; return; }

    local new="env = ${FIELD_RESULTS[variable]}, ${FIELD_RESULTS[value]}"
    [[ "$new" == "$old" ]] && return
    make_backup
    delete_from_section "ENV" "$old"
    append_to_section "ENV" "$new"
    msg_ok "Updated."
}

# reload / view

do_reload() {
    draw_header "reload" ""; printf "\n"
    if command -v hyprctl &>/dev/null; then
        printf "  ${CYN}reloading...${R}\n"
        hyprctl reload 2>&1 && msg_ok "done." || msg_err "hyprctl reload failed."
    else
        msg_err "hyprctl not found — are you in a Hyprland session?"
    fi
    printf "\n${MUTED}  press any key...${R}"; IFS= read -rsn1 < /dev/tty
}

view_raw() {
    draw_header "raw config" "$MANAGED_CONF"; printf "\n"
    local n=1
    while IFS= read -r line; do
        printf "  ${MUTED}%3d${R}  ${WHITE}%s${R}\n" $n "$line"; (( n++ ))
    done < "$MANAGED_CONF"
    printf "\n${MUTED}  press any key...${R}"; IFS= read -rsn1 < /dev/tty
}

# main menu!!!

main_menu() {
    local -a menu=(
        "keybinds"
        "monitors"
        "workspaces"
        "window rules"
        "general"
        "decoration"
        "animations"
        "input"
        "misc"
        "autostart"
        "env vars"
        "──────────────"
        "add custom line"
        "open files"
        "reload hyprland"
        "quit"
    )
    while true; do
        pick_list "MAIN MENU" "$MANAGED_CONF" "${menu[@]}"
        case "$PICK_ACTION" in
            quit) return ;;
            select)
                case $PICKED_IDX in
                    0)  section_keybinds ;;
                    1)  section_monitors ;;
                    2)  section_workspaces ;;
                    3)  section_windowrules ;;
                    4)  section_general ;;
                    5)  section_decoration ;;
                    6)  section_animations ;;
                    7)  section_input ;;
                    8)  section_misc ;;
                    9)  section_exec ;;
                    10) section_env ;;
                    11) : ;;
                    12) section_add_custom ;;
                    13) open_files_menu ;;
                    14) do_reload ;;
                    15) return ;;
                esac ;;
            new|delete) : ;;
        esac
    done
}

# entries (im finally done)

main() {
    (( BASH_VERSINFO[0] < 4 )) && { printf "bash 4+ required\n" >&2; exit 1; }
    if [[ $DEBUG -eq 1 ]]; then
        printf '=%.0s' {1..60} >> "$DEBUG_LOG"; printf '\n' >> "$DEBUG_LOG"
        dbg "START bash=$BASH_VERSION TERM=$TERM cols=$COLS lines=$LINES_T"
        printf "  ${ACC}debug → %s${R}\n" "$DEBUG_LOG"; sleep 1
    fi
    init_config; _smcup; _hide_cursor; main_menu
}

main "$@"


