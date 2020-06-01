# Maintainer: BeChris (gmail)

pkgname=python2-lhafile
pkgver=0.2.2
pkgrel=1
pkgdesc="LHA archive support for Python 2"
arch=('i686' 'x86_64')
url="http://fengestad.no/python-lhafile/"
license=('BSD')
depends=('python2')
source=("$pkgname::git+https://github.com/FrodeSolheim/python-lhafile#tag=v${pkgver}")
md5sums=('SKIP')


package() {
  cd "$pkgname"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
