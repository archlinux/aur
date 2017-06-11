# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.9.2
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/lah7/polychromatic/archive/v$pkgver.tar.gz")
url='https://github.com/lah7/polychromatic'
makedepends=('rsync')
depends=('python' 'hicolor-icon-theme' 'python-razer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
sha512sums=('697e50cbafb8d9373b59b637e21471b097bcaea049378072cac12101c94a50a5710715ed760a5d7351eb3f23cb018eac22f1df41871786ddf0bcf0a2383f05e1')

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
