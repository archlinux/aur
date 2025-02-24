# Maintainer:

## options
if [[ (-z "$_srcinfo" && -z "$_pkgver") ]]; then
  : ${_autoupdate:=true}
fi

#: ${_dotnet_type=-bin}
: ${_install_path:=usr/lib}

_pkgname="ryujinx"
pkgname="$_pkgname"
pkgver=1.2.82
pkgrel=2
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://github.com/Ryubing/Ryujinx"
license=('MIT')
arch=('x86_64')

source PKGBUILD.common
source PKGBUILD.release

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
