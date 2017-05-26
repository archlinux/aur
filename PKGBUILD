# Maintainer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgname=python2-mechanicalsoup
pkgver=0.7.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python2' 'python2-beautifulsoup4' 'python2-requests' 'python2-six')
makedepends=('python2-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('3311bd3a45db5235b5798b1d995bb4d6dc5df5b5acdad45ee4f6b6c0fa0230b793cd258c23fa7b6be1987d1f09a695803080014624f4ae6042bf1f987460a78c')

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python2 setup.py check
}

package_python2-mechanicalsoup() {
  cd $srcdir/${_pkgname}-$pkgver 
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

