# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Maintainer: yugrotavele <yugrotavele at archlinux dot us>

pkgname=dosage
pkgver=2.15
pkgrel=1
pkgdesc="A comic downloader and archiver"
url="http://wummel.github.io/dosage"
license=("GPL")
arch=('any')
depends=('python-requests')
source=("https://pypi.python.org/packages/source/d/dosage/$pkgname-$pkgver.tar.gz")
md5sums=('dcc33a7095bd1090421fc73e2ef06cc5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"  --optimize=1
}