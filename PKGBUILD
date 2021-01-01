# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-session-bin'
pkgver='5.0.0'
pkgrel=2
_timestamp=1604701048
_commit=e3640fb
pkgdesc='System76 Pop Session'
arch=('x86_64')
url='https://github.com/pop-os/session'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-session')
provides=('pop-session')
depends=("gnome-shell")

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-session/pop-session_${pkgver}~${_timestamp}~20.10~${_commit}_all.deb")
sha256sums=('1cf51ae1a9d52b8e0ea71674b1252720c16b368ed5560ee8a346bce7c9fa533d')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
