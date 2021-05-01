# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-session-bin'
pkgver='5.0.0'
pkgrel=4
_timestamp=1619191259
_commit=cb619a2
pkgdesc='System76 Pop Session'
arch=('x86_64')
url='https://github.com/pop-os/session'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-session')
provides=('pop-session')
depends=("gnome-shell")

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-session/pop-session_${pkgver}~${_timestamp}~21.04~${_commit}_all.deb")
sha256sums=('07e528388da4d8735776c51d75ab089c06babd5b5338e0bc3cc59a4d61d4acb0')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
