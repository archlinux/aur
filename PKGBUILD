# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=ttf-octicons
pkgver=4.3.0
pkgrel=1
pkgdesc="A scalable set of icons handcrafted with <3 by GitHub"
arch=('any')
license=('MIT')
url="http://octicons.github.com/"
makedepends=('git')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/primer/octicons/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
install=$pkgname.install

package() {
  cd "${srcdir}/octicons-${pkgver}"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 build/font/octicons.ttf $pkgdir/usr/share/fonts/TTF/
}
