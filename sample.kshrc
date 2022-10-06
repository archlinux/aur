# This file contains examples of some of the things you may want to
# include in a user startup file.

# Set the shell options
set -o emacs -o notify -o globstar
[[ -o nobackslashctrl ]] && set -o nobackslashctrl
[[ -o globcasedetect ]] && set -o globcasedetect
#[[ -o noarrowkeysearch ]] && set -o noarrowkeysearch

# Specify search path for autoloadable functions
FPATH=/usr/share/ksh/functions:~/.func

# Optional: Autoload functions installed with ksh
#autoload autocd
#autoload man
#autoload dirs
#autoload pushd
#autoload popd

# Optional: Set the precision of the time keyword to six and use %C
#((.sh.version >= 20220606)) && TIMEFORMAT=$'\nreal\t%6lR\ncpu\t%6lC'

# Optional: Avoid certain file types in completion
#FIGNORE='@(*.o|~*)'

# Save more commands in history
HISTSIZE=2000
#HISTEDIT=$EDITOR

# Remove the problematic default 'r' alias (this is only
# done when it's safe, as old versions of ksh can crash
# after 'unalias r').
((.sh.version >= 20220806)) && unalias r

# Below is a basic example that provides extra tilde expansions
if ((.sh.version >= 20210318)) && [[ $(id -u) != 0 ]]; then
	.sh.tilde.get()
	{
		case ${.sh.tilde} in
		'~docs')   .sh.tilde=~/Documents ;;
		'~dls')    .sh.tilde=~/Downloads ;;
		'~share')  .sh.tilde=~/.local/share ;;
		esac
	}
fi

# Associative array containing a set of RGB color codes.
# Terminals emulators with support for wide color ranges
# can take better advantage of this.
typeset -A color=(
	[bright_lavender]=$'\E[38;2;191;148;228m'
	[red]=$'\E[38;2;255;0;0m'
	[cyan_process]=$'\E[38;2;0;183;235m'
	[ultramarine_blue]=$'\E[38;2;65;102;245m'
	[reset]=$'\E[0m'
	# Some extra examples
	#[start_title]=$'\E]0;'
	#[bell]=$'\a'
	#[underline]=$'\E[4m'
	#[spaced_dots]=$'\E[4:5m'
)

PS1.get()
{
	ret=$?  # Workaround $? bug in ksh < 2021-03-16 (cf. https://github.com/ksh93/ksh/pull/226)

	pwd=$(pwd 2>/dev/null)
	case ${pwd} in
		~)		pwd='~' ;;
		~docs)		pwd='~docs' ;;
		~dls)		pwd='~dls' ;;
		~share)		pwd='~share' ;;
		'')		pwd="${color[red]}No pwd found" ;;
		/)		;;  # Do nothing
		*)		pwd=${pwd##*/} ;;
	esac
	if [[ $(id -u) == 0 ]]; then
		PS1='${color[bright_lavender]}${pwd} ${color[red]}#${color[reset]} '
	else
		PS1='${color[ultramarine_blue]}${pwd} ${color[cyan_process]}\$${color[reset]} '
	fi

	return $ret
}
