#!/usr/bin/env bash
set -euo pipefail
# v30

TMP_PACKER_DIR='/tmp/.packer_wrapper_tmp'
TMP_PACKER_DIR=${ mktemp --dry-run ${TMP_PACKER_DIR}_${EUID}_XXXXXXXXXX; }
TMP_PACMAN_CACHE_DIR=${TMP_PACKER_DIR}/pacman_cache/
TMP_PACMAN_CONF_PATH=${TMP_PACKER_DIR}/pacman_tmp.conf
TMP_PACMAN_LOG_PATH=${TMP_PACKER_DIR}/pacman_tmp.log
TMP_MAKEPKG_CONF_PATH=${TMP_PACKER_DIR}/makepkg_tmp.conf

# параметры запуска pacman (по умолчанию tmpfs)
PACMAN_CMD_OPTIONS_ARRAY=(
    "--config   ${TMP_PACMAN_CONF_PATH}"
    "--cachedir ${TMP_PACMAN_CACHE_DIR}"
    "--logfile  ${TMP_PACMAN_LOG_PATH}"
    '--color always'
)

# параметры запуска pacman  (для случая опции --default)
PACMAN_CMD_OPTIONS_DEFAULT_ARRAY=(
    "--config /etc/pacman.conf"
    '--color  always'
)

# добавляемые опции во временный pacman.conf.
# ПЕРЕРАБОТАТЬ: Как быть если составной параметр типа: ParallelDownloads = 5 ????
# прям сдесь сделать комманду sed для замены ?
PACMAN_CONF_OPTIONS_ARRAY=(
    'Color'
    'VerbosePkgLists'
)

MAKEPKG_CONF_OPTIONS='
MAKEFLAGS="-j$(nproc)"
# disable creating debug packages
OPTIONS+=(!debug)
# disable compression entirely. see: man makepkg.conf
PKGEXT=".pkg.tar"
SRCEXT=".src.tar"
'

# associated array of env folders to create
declare -rA ENV_FOLDERS_ARRAY=(
    # to disable pacman warning: no ... cache exists, creating...
        [TMP_PACKER_DIR]=${TMP_PACKER_DIR}
  [TMP_PACMAN_CACHE_DIR]=${TMP_PACMAN_CACHE_DIR}
    # env vars for yay ( see: man yay )
               [AURDEST]=${TMP_PACKER_DIR}/packer/_AURDEST
       [XDG_CONFIG_HOME]=${TMP_PACKER_DIR}/packer/_XDG_CONFIG_HOME
        [XDG_CACHE_HOME]=${TMP_PACKER_DIR}/packer/_XDG_CACHE_HOME
               [GOCACHE]=${TMP_PACKER_DIR}/packer/_GOCACHE
    # env vars for paru ( see: man paru )
        [XDG_STATE_HOME]=${TMP_PACKER_DIR}/packer/_XDG_STATE_HOME
    # env vars for makepkg ( see: man makepkg.conf; /etc/makepkg.conf )
              [BUILDDIR]=${TMP_PACKER_DIR}/makepkg/_BUILDDIR
               [PKGDEST]=${TMP_PACKER_DIR}/makepkg/_PKGDEST
               [SRCDEST]=${TMP_PACKER_DIR}/makepkg/_SRCDEST
            [SRCPKGDEST]=${TMP_PACKER_DIR}/makepkg/_SRCPKGDEST
               [LOGDEST]=${TMP_PACKER_DIR}/makepkg/_LOGDEST
)

DEFAULT_OPTION_STR='--default'
declare -i DEFAULT_FLAG=${DEFAULT_FLAG:=0}  # признак что запуск c default /etc/pacman.conf. может прилететь с перевывозом через env vars

SCRIPT_ARGS=${*}
CALLABLE_PACKER=${ basename ${0}; }

#-------------------------------------------------------------------------------
function __main__ ()
{
    if (( DEFAULT_FLAG == 0 )); then
        # ищем слово опции умолчаний в аргументах. contains in array: https://stackoverflow.com/a/28032613
        if grep --quiet --word-regexp -- ${DEFAULT_OPTION_STR} <<< "${SCRIPT_ARGS}"; then
            DEFAULT_FLAG=1
        fi
    fi

    if (( DEFAULT_FLAG == 1 )); then
        SCRIPT_ARGS=${SCRIPT_ARGS//${DEFAULT_OPTION_STR}/}                  # удаляем слово заменой умолчаний из параметров. from: https://github.com/koalaman/shellcheck/wiki/SC2001
        PACMAN_CMD_OPTIONS_ARRAY=("${PACMAN_CMD_OPTIONS_DEFAULT_ARRAY[@]}") # назначаем опции для случая --default
    fi

    local _pacman_cache_location=${ (( DEFAULT_FLAG == 0 )) && echo tmpfs || echo CacheDir: ${ pacman-conf CacheDir; }; }
    say ":: wrapper ${CALLABLE_PACKER} ${_pacman_cache_location}"

    _check_packer_exist
    trap _cleanup EXIT            # регистрируем обработчик сигнала EXIT типа Ctrl+C, список: trap -l
    _prepare_folders_and_configs
    _run_packer
}

#-------------------------------------------------------------------------------
function _check_packer_exist ()
{
    PACKER_BIN="/usr/bin/${CALLABLE_PACKER}"
    if ! command -v ${PACKER_BIN} > /dev/null 2>&1; then
        warning ":: error: ${CALLABLE_PACKER}: packer command: /usr/bin/${CALLABLE_PACKER} not found. Not installed ? ... exit"
        exit 1
    fi
}

#-------------------------------------------------------------------------------
function _cleanup ()
{
    (( DEFAULT_FLAG == 1 )) && return 0;

    say ':: cleaning'
    # pacman yay
    rm -rf /var/cache/pacman/pkg/* "${ pacman-conf CacheDir; }*"  \
                               > /dev/null 2>&1 || true
    rm -rf ${TMP_PACKER_DIR}   > /dev/null 2>&1 || true
    # yay defaults
    rm -rf ~/.cache/yay        > /dev/null 2>&1 || true
    rm -rf ~/.config/yay       > /dev/null 2>&1 || true
    # paru defaults
    rm -rf ~/.cache/paru       > /dev/null 2>&1 || true
    rm -rf ~/.local/state/paru > /dev/null 2>&1 || true
}

#-------------------------------------------------------------------------------
#~function _get_available_sudo_method ()
#~{
    #~command -v sudo > /dev/null 2>&1 && { SUDO_METHOD='sudo'; return 0; }
    #~command -v doas > /dev/null 2>&1 && { SUDO_METHOD='doas'; return 0; }
    #~SUDO_METHOD='run0'
#~}

#-------------------------------------------------------------------------------
function _prepare_folders_and_configs ()
{
    # баг в pacman когда не удаляются папки c предыдущих разов работы yay /var/cache/pacman/pkg/download-JUwrO8
    rm -rf /var/cache/pacman/pkg/* "${ pacman-conf CacheDir; }*" > /dev/null 2>&1 || true

    (( DEFAULT_FLAG == 1 )) && return 0;

    # строка всех папок. ENV_FOLDERS_ARRAY merge values
    local _env_folders_str=${ENV_FOLDERS_ARRAY[*]}
    # get string of folders  merged key=val (environment variables). восклицательный знак перед переменной - ключ
    for key in "${!ENV_FOLDERS_ARRAY[@]}"; do
        ENV_FOLDERS_KEY_VALUE_STR+="$key=${ENV_FOLDERS_ARRAY[$key]} ";
    done

    mkdir -p ${_env_folders_str} # создаётся каждый раз при перевызовах со своими правами

    # генерим временный makepkg.conf
    cp -f /etc/makepkg.conf ${TMP_MAKEPKG_CONF_PATH}
    echo "${MAKEPKG_CONF_OPTIONS}" | tee -a ${TMP_MAKEPKG_CONF_PATH} > /dev/null

    # генерим временный pacman.conf с подстановкой своих значений
    local _pacman_option
    cp -f /etc/pacman.conf ${TMP_PACMAN_CONF_PATH}
    for _pacman_option in ${PACMAN_CONF_OPTIONS_ARRAY[*]}; do
        # удаляем по паттерну и сразу добавляем после [options]
        sed -i "/${_pacman_option}/d; /\[options\]/a ${_pacman_option}" ${TMP_PACMAN_CONF_PATH}
    done
}

#-------------------------------------------------------------------------------
function _run_packer ()
{
    local _aur_helper_addon='--pacman /usr/bin/pacman'           # for yay pacman direct call to avoid recall from /usr/local/bin
    [[ ${CALLABLE_PACKER} == 'pacman' ]] && _aur_helper_addon='' # для pacman не нужно указывать (выдаст ошибку)
    if (( DEFAULT_FLAG == 1 )); then
        env DEFAULT_FLAG=1 ${PACKER_BIN} ${_aur_helper_addon} ${PACMAN_CMD_OPTIONS_ARRAY[*]} ${SCRIPT_ARGS}
    else
        env MAKEPKG_CONF=${TMP_MAKEPKG_CONF_PATH} ${ENV_FOLDERS_KEY_VALUE_STR} ${PACKER_BIN} ${_aur_helper_addon} ${PACMAN_CMD_OPTIONS_ARRAY[*]} ${SCRIPT_ARGS}
    fi
}

#-------------------------------------------------------------------------------
# если вывод не в stdout то ничего не пишем, типа потом можно обработать
function say    () { ! [[ -t 1 ]] && return 0; colorCode='0;36'; printf "\033[${colorCode}m%s\n\033[0m" "$*"; }
#-------------------------------------------------------------------------------
function warning() { ! [[ -t 1 ]] && return 0; colorCode='0;91'; printf "\033[${colorCode}m%s\n\033[0m" "$*"; }
#-------------------------------------------------------------------------------
__main__ "${@}"
