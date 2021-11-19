# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ratelimit
_pkgname=ratelimit
pkgver=2.2.1
pkgrel=1
pkgdesc="API rate limit decorator"
arch=('any')
url="https://github.com/tomasbasham/ratelimit"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('af8a9b64b821529aca09ebaf6d8d279100d766f19e90b5059ac6a718ca6dee42')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

## vim:ts=2:sw=2:et:
