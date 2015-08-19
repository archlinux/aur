# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=python2-uncompyle2
_pkgname=uncompyle2
pkgver=1.1
pkgrel=1
pkgdesc="Python 2.7 byte-code decompiler"
arch=('any')
url="https://github.com/wibiti/${_pkgname}/"
license=('MIT')
depends=('python2')
source=("https://github.com/wibiti/${_pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('54fa5355eaf0973c3b986f39499e2ae700201502ffbde956c47b620117db2a699b9329859f385d063e178223a716088c8b1955eca7d0a22ce6d0145ade56ac01')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
