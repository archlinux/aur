# Maintainer:

## options
if [[ (-z "$_srcinfo" && -z "$_pkgver") ]]; then
  : ${_autoupdate:=true}
fi

: ${_install_path:=usr/lib}
: ${startdir:=.}

_pkgname="ryujinx"
pkgname="$_pkgname"
pkgver=1.2.80
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://github.com/Ryubing/Ryujinx"
license=('MIT')
arch=('x86_64')

source "$startdir"/PKGBUILD.common
source "$startdir"/PKGBUILD.release

_update_version
_source_ryujinx

source+=(
  PKGBUILD.common
  PKGBUILD.release
)
sha256sums+=(
  'SKIP'
  'SKIP'
)
