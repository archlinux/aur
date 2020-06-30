# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: procrastinator <pseudoj2 at gmail dot com>

pkgname=ttf-essays
pkgver=2.100
pkgrel=2
pkgdesc="A font based on the typeface used in a 1743 English translation of Montaigne's Essays."
arch=('any')
license=('LGPL')
url="https://www.thibault.org/fonts/essays/"
depends=()
source=("https://www.thibault.org/fonts/essays/essays1743-${pkgver}-1-ttf.tar.gz")
sha256sums=('94b336fbf5ea092a050144f88300c68235f9891c66e97e036b03d285fec03fa8')

package() {
  cd "$srcdir/essays1743"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
