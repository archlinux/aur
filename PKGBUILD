# Maintainer: Stuart Cardall <developer at it-offshore.co.uk>
pkgname=python-pygubu
_pkgname=pygubu
pkgver=0.35.5
pkgrel=0
pkgdesc="python pygubu core library"
url="https://github.com/alejandroautalan/pygubu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'tk' 'python-appdirs')
source=("{$pkgname}-${pkgver}.tar.gz::https://github.com/alejandroautalan/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9c1b558c4d692e6b3af9b3a82f603bea')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 -m pip install . --prefix=/usr --root="$pkgdir"
}
