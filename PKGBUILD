# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.9.3
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/lah7/polychromatic/archive/v$pkgver.tar.gz")
url='https://github.com/lah7/polychromatic'
makedepends=('rsync')
depends=('python' 'hicolor-icon-theme' 'python-razer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
sha512sums=('5ac09d26f239bfb3ec25a4104649eb7b8852746b61cc43f9b5cae01b39e740373e1567b2ddee2791de87504c02c993ec25c410850983df75da53561bf06e1e0a')

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
