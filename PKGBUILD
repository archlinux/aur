# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=python2-pyarabic
pkgver=0.4
pkgrel=1
pkgdesc="Arabic text tools for Python"
arch=('any')
url="https://github.com/linuxscout/pyarabic"
license=('GPL')
depends=('python2')
source=("$url/archive/master.zip")
sha256sums=('ef7c12ba38ad79c346d98fa51f3a5f20539cc59f54496a21122ec1d7d9a4f11c')

package() {
  # FIXME: cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/pyarabic-master"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/"
}
