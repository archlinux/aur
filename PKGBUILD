# Maintainer: akku <akku (at) f5.si>
pkgname=sudo-is-doas
pkgver=1
pkgrel=2
pkgdesc="Replace sudo with doas, but it is not more functional than doas-sudo-shim."
arch=('any')
license=('Unlicense')
depends=('opendoas')
conflicts=('sudo')
provides=('sudo')

package() {
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s doas sudo
}
