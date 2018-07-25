# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

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
sha256sums=('e4469334f223132963eb676f4086c25ed1f0cfd7f2b39e4bb42ecb7378d9d164')
install=$pkgname.install

package() {
  cd "${srcdir}/octicons-${pkgver}"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 build/font/octicons.ttf $pkgdir/usr/share/fonts/TTF/
}
