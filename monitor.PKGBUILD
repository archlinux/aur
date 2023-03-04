# Maintainer: Moses Narrow <moses@skycoin.com>
pkgname=skywire-monitor
_pkgname=${pkgname}
pkgdesc="a simple service and drop-in config - view skywire service status and debug logging in browser"
pkgver='1.3.5'
pkgrel=1
_pkgver="${pkgver}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
license=('license-free')
depends=("gnu-netcat" "ansifilter" "expect" "skywire")
_service=("skywire-monitor.service")
_serviceconf=("override.conf")
install=monitor.install
_source=(
"${_service[@]}"
"${_serviceconf[@]}"
)
source=("${_source[@]}")
sha256sums=('72c189a1c1994e90cab0ab3e21a3bf2932b229210a0bc9e296d6a4400e2a52a1'
            'f26f0d3aa3baeb22fe1f0c94fe86113a638195f0070c5a2cd80e72463de5319a')

package() {
  _pkgdir="${pkgdir}"
  _systemddir="usr/lib/systemd/system"
_package
}
#_package function - used in build variants
_package() {
#declare the _pkgdir and systemd directory

_msg2 'Installing systemd services'
for _i in "${_service[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_i}" "${_pkgdir}/${_systemddir}/${_i}"
done
_msg2 'Installing skywire service drop-in config'
for _i in "${_serviceconf[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_i}" "${_pkgdir}/${_systemddir}/skywire.service.d/${_i}"
done

if command -v tree &> /dev/null ; then
_msg2 'package tree'
  tree -a ${_pkgdir}
fi
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF} ${mesg}${ALL_OFF}\n" "$@"
}
