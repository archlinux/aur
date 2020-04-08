# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-session-bin'
pkgver='4.0.4'
pkgrel=1
_timestamp=1585339712
_commit=151ef42
pkgdesc='System76 Pop Session'
arch=('x86_64')
url='https://github.com/pop-os/session'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-session')
provides=('pop-session')
depends=("gnome-shell")

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-session/pop-session_${pkgver}~${_timestamp}~20.04~${_commit}_all.deb")
sha256sums=('de7a21463d61f389d3ec798f66d0a537384e52c1aa3b7bc7eb2c027752893937')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
