# Maintainer:

## options
if [[ (-z "$_srcinfo" && -z "$_pkgver") ]]; then
  : ${_autoupdate:=true}
fi

#: ${_dotnet_type=-bin}
: ${_install_path:=usr/lib}

_pkgname="ryujinx"
pkgname="$_pkgname-canary"
pkgver=1.3.30
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://git.ryujinx.app/ryubing/ryujinx"
license=('MIT')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

source PKGBUILD.common
source PKGBUILD.canary

_update_version
_source_ryujinx

source+=(
  PKGBUILD.canary
  PKGBUILD.common
)
sha256sums+=(
  'SKIP'
  'SKIP'
)
