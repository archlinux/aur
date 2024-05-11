# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-throttler
_pkgname=${pkgname#python-}
pkgver=1.2.2
pkgrel=2
pkgdesc='Zero-dependency Python package for easy throttling with asyncio support'
arch=('any')
url="https://github.com/uburuntu/throttler"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=3.0')
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('753bf1954f8580ca6ea7a9787dbacbe29f0da8fb32598a2386a3f04497d00ad9')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
