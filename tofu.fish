
function __complete_tofu
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /usr/bin/tofu
end
complete -f -c tofu -a "(__complete_tofu)"

