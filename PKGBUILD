# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=friendly-find
pkgver=1.0.1
pkgrel=2
pkgdesc="A friendlier find (ffind)."
arch=('any')
url="https://github.com/sjl/friendly-find"
license=('GPL3')
depends=('python')
conflicts=('sleuthkit-java')
source=("https://github.com/sjl/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('544fcacb3fe011b9f562b046a71dae6b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver"/ffind "$pkgdir"/usr/bin/ffind
  install -Dm644 "$srcdir/$pkgname-$pkgver"/ffind.1 "$pkgdir/usr/share/man/man1/ffind.1"
}
