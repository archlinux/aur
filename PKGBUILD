# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-spectra
_pkgname=${pkgname#python-}
pkgver=0.0.11
pkgrel=1
pkgdesc="Easy color scales and color conversion for Python"
arch=('any')
url="https://github.com/jsvine/spectra"
license=('MIT')
depends=('python-colormath')
makedepends=('python-setuptools')
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('bb7f38ce7a89363e02d0832e84200e87649008beec432815aa0fee8f037bb496')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
