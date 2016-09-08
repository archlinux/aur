# Context executable wrapper
declare -r context_root=/usr/share/texmf
declare font_dirs=""
if [[ -d "${HOME}/.fonts" ]]; then
    declare font_dirs+="${HOME}/.fonts"
fi
if [[ -d /usr/share/fonts ]]; then
    [[ -n "${font_dirs}" ]] && declare font_dirs+=";"
    declare font_dirs+=/usr/share/fonts
fi

declare -x OSFONTDIR="${font_dirs:-}"
declare -x TEXMF="{${context_root},${HOME}/.texmf}"
declare -x TEXMFCACHE=${HOME}/.texmf/texmf-cache
declare -x TEXMFCNF=${context_root}/texmf/web2c
# “platform” mingles architecture and OS so we neutralize it
# to mean just the latter; that’s where the binaries go anyways.
declare -x TEXOS=texmf-linux
declare -x MTX_PLATFORM=linux

# vim:et:ft=sh:sw=2:ts=8

