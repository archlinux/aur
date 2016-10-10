# Maintainer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgname=python2-mechanicalsoup
pkgver=0.6.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python2' 'python2-beautifulsoup4' 'python2-requests' 'python2-six')
makedepends=('python2-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('30f27209ecaa1c66a2ffe2e290806c9d32ed985902f760f5faa226e16e84188217923ee7ecfab873b6b2395d3c13c6d27e70a3dfbb6229e3782749afac12b241')

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python2 setup.py check
}

package_python2-mechanicalsoup() {
  cd $srcdir/${_pkgname}-$pkgver 
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

