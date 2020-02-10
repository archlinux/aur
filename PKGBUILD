# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-session-bin'
pkgver='3.0.2'
pkgrel=3
_timestamp=1579638671
_commit=383abda
pkgdesc='System76 Pop Session'
arch=('x86_64')
url='https://github.com/pop-os/session'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-session')
provides=('pop-session')
depends=("gnome-shell")

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-session/pop-session_${pkgver}~${_timestamp}~20.04~${_commit}_all.deb")
sha256sums=('3e2bc5f1f2f23730a69faace6a47e02c093ab9de3053e6c1f4fa228b7c58ee79')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
