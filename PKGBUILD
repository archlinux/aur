# Maintainer : Darshit Shah <darnir@gmail.com>
# Contributor : Gustavo Alvarez <sl1pkn07@gmail.com>
#
pkgname=python-sendfile
_pkgname=pysendfile
pkgver=2.0.1
pkgrel=1
pkgdesc="A Python interface to sendfile(2)"
url="https://github.com/giampaolo/pysendfile"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-distribute')
source=("https://github.com/giampaolo/pysendfile/archive/release-${pkgver}.tar.gz")
md5sums=('928b468e0676c3f90a824b472fbaf4b3')

package() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
