# Maintainer: Michael Duell <michael.duell@rub.de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=btrbk
pkgver=0.23.2
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
depends=('perl' 'btrfs-progs')
optdepends=('openssh: remote backup support',
	    'pv: --progress support')
source=("http://digint.ch/download/btrbk/releases/${pkgname}-${pkgver}.tar.xz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
sha384sums=('64d6601546d2b26ac21c96d0eda19e307665ce4a8ced604bfb4b819637c751b70c0d3c2a0fc29bf28feee82f02d5481f')
