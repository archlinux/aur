# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname='python-moc'
pkgver=1.0
pkgrel=1
pkgdesc="Python bindings for Music On Console"
arch=('any')
url="http://github.com/rscholer/${pkgname}"
license=('MIT')
depends=('python' 'moc')
conflicts=("${pkgname}-git")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
md5sums=('6f281bde33342920eebe772788b3aff1')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}
# vim:set ts=2 sw=2 et:
