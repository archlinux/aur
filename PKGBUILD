# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic
pkgver=0.3.11.2
pkgrel=2
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/lah7/polychromatic/archive/v$pkgver.tar.gz")
url='https://github.com/lah7/polychromatic'
makedepends=('nodejs-less')
depends=('python' 'hicolor-icon-theme' 'python-openrazer' 'webkit2gtk' 'libappindicator-gtk3' 'imagemagick')
sha512sums=('1959c790f2b2fb67e2b0e94a9b68731497ecafb5b07c2e1c9af764151c4927b41493f954fa613a5f0a25521d25bec9a7dc1be2affaf530f9116e7229f7530e9e')

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
