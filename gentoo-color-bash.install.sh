_usage='
    USAGE:
        after install, you can enable it:
        A. for local users:
               add line:
                   source /usr/share/gentoo-color-bash/10-gentoo-color.bash
               to users: ~/.bashrc and /etc/skel/.bashrc
        B. for system globaly:
            1. in users: ~/.bashrc and /etc/skel/.bashrc remove\comment var PS1 or empty this files
            2. add line:
                   source /usr/share/gentoo-color-bash/10-gentoo-color.bash
               to global: /etc/bash.bashrc
            3. relogin

        Now you can add (if needed) you own ~/.dir_colors or /etc/DIR_COLORS for perfect ls.
        See arch wiki or github for examples.
'

#--------------------------------------------------------------------------------------------------
function color_printf () {
    # from: https://stackoverflow.com/a/77984060/6195439
    # еще цвета: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
    # example: color_printf red 'test \n'
    if [[ $# != 2 ]] ; then
        echo "[ERROR] color <color-name> <text> expected two arguments, but got $#" >&2
        return 1
    fi

    local -r colorName="$1"
    local -r message="$2"
    local colorCode="0;37"

    case "${colorName,,}" in
        black          ) colorCode='0;30' ;;
        red            ) colorCode='0;31' ;;
        green          ) colorCode='0;32' ;;
        yellow         ) colorCode='0;33' ;;
        blue           ) colorCode='0;34' ;;
        magenta        ) colorCode='0;35' ;;
        cyan           ) colorCode='0;36' ;;
        white          ) colorCode='0;37' ;;
        bright_black   ) colorCode='0;90' ;;
        bright_red     ) colorCode='0;91' ;;
        bright_green   ) colorCode='0;92' ;;
        bright_yellow  ) colorCode='0;93' ;;
        bright_blue    ) colorCode='0;94' ;;
        bright_magenta ) colorCode='0;95' ;;
        bright_cyan    ) colorCode='0;96' ;;
        bright_white   ) colorCode='0;97' ;;
        gray           ) colorCode='0;90' ;;
        *              ) colorCode='0;37' ;;
    esac

    printf "\e[${colorCode}m${message}\e[0m"
}

#--------------------------------------------------------------------------------------------------
function post_install() {
    color_printf green "${_usage}"
}

#--------------------------------------------------------------------------------------------------
function post_upgrade() {
    post_install ${1}
}

#post_install
