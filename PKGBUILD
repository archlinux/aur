# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-lzstring
_pkgname=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc='String encoding/decoding of binary data'
arch=('any')
url="https://github.com/gkovacs/lz-string-python"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=($_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/lzstring/lzstring-$pkgver.tar.gz)
sha256sums=('1afa61e598193fbcc211e0899f09a9679e33f9102bccc37fbfda0b7fef4d9ea2')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
