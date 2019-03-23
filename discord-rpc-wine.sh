# append dll paths to WINEDLLPATH

appendwinepath() {
	case ":$WINEDLLPATH:" in
		*:"$1":*)
			;;
		*)
			WINEDLLPATH="${WINEDLLPATH:+$WINEDLLPATH:}$1"
	esac
}

if test -d '/usr/lib/discord-rpc-wine/x86_64'; then
	appendwinepath '/usr/lib/discord-rpc-wine/x86_64'
fi
appendwinepath '/usr/lib/discord-rpc-wine/i686'

unset appendwinepath
export WINEDLLPATH

## Uncomment the following line to always use the dll override
## This might break some games as not everything is implemented in this discord-rpc implementation
#export WINEDLLOVERRIDES="${WINEDLLOVERRIDES:+$WINEDLLOVERRIDES;}discord-rpc=b"

