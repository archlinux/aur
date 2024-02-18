
function __complete_boundary
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /usr/bin/boundary
end
complete -f -c boundary -a "(__complete_boundary)"

