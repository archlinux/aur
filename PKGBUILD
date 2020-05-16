# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-session-bin'
pkgver='4.0.6'
pkgrel=2
_timestamp=1589393668
_commit=bf50dee
pkgdesc='System76 Pop Session'
arch=('x86_64')
url='https://github.com/pop-os/session'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-session')
provides=('pop-session')
depends=("gnome-shell")

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-session/pop-session_${pkgver}~${_timestamp}~20.04~${_commit}_all.deb")
sha256sums=('f2c1f6882ffdbb7dd2dc8abd8ead2002364d78341ab9da615c22144b411f7bee')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
