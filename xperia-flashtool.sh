#!/bin/sh

if [ $# -eq 0 ]; then
  APP_CMD='FlashTool'
else
  case "$1" in
    -c|--console)
      APP_CMD='FlashToolConsole'
      shift
      ;;
    -g|--graphical)
      APP_CMD='FlashTool'
      shift
      ;;
    *)
      cat << EOF
Usage: $0 [OPTIONS]

Options are:
    -h, --help                       : show this help
    -c, --console                    : console mode usage
    -g, --graphical                  : graphical mode usage
EOF
      exit 1
      ;;
  esac
fi

if [ -d "/usr/lib/xperia-flashtool/firmwares" ]
then
  mkdir -p "$HOME/.flashTool/firmwares"
  mv /usr/lib/xperia-flashtool/firmwares/* "$HOME/.flashTool/firmwares"
fi

/usr/lib/xperia-flashtool/${APP_CMD} $@
