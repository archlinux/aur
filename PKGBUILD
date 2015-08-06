# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=geoipgen
pkgver=0.4
pkgrel=3
pkgdesc="An IP network tool for generating geotargeted lists of IP addresses"
arch=('any')
url=('http://code.google.com/p/geoipgen')
license=('BSD')
depends=('ruby')
source=("http://geoipgen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('edae9618c3413be8e380f1e10b5b91dd')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 geoipgen $pkgdir/usr/bin/geoipgen

  for f in README CHANGELOG TODO; do
    install -Dm644 $f $pkgdir/usr/share/doc/geoipgen/$f
  done
}
