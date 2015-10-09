# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=pacgem
pkgver=0.9.12
pkgrel=2
pkgdesc="Install Ruby Gems as Arch Linux packages"
arch=('any')
url="http://github.com/minad/pacgem"
license=('GPL')
depends=('ruby')
source=('pacgem' 'pacgem.8')
sha256sums=('e9ba34a631c12fcfe341d75aa78755cdfa65277b1bdc453b7163d1e70ef44e3a'
            '953f45fecbe08cb5cfd700aadfca9c5db548d1f52b69c35716d79092b03c25e0')
conflicts=('pacgem-git')

package() {
  install -D -m755 $srcdir/pacgem $pkgdir/usr/bin/pacgem
  install -D -m644 $srcdir/pacgem.8 $pkgdir/usr/share/man/man8/pacgem.8
}
