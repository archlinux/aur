# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.11.1
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/lah7/polychromatic/archive/v$pkgver.tar.gz")
url='https://github.com/lah7/polychromatic'
makedepends=('nodejs-less')
depends=('python' 'hicolor-icon-theme' 'python-razer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
sha512sums=('860068f0e6ca49bc73f561d9fa76f24899ae4ceaf39cc908a48c4e44b9da01994f3d2b46a4739836ae7fe2e569b26b7f787327213eac5c5a9168cabe0d9813f5')

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
