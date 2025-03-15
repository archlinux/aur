# Maintainer: Stuart Cardall <developer at it-offshore.co.uk>
pkgname=python-pygubu
_pkgname=pygubu
pkgver=0.36.3
pkgrel=1
pkgdesc="python pygubu core library"
url="https://github.com/alejandroautalan/pygubu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'tk' 'python-appdirs')
source=("{$pkgname}-${pkgver}.tar.gz::https://github.com/alejandroautalan/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('36ee8660573465ac6676dbf2b62981e5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 -m pip install . --prefix=/usr --root="$pkgdir"
}
