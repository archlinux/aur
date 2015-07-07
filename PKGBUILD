# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-api-explorer
_pypiname=Mopidy-API-Explorer
pkgver=1.0.1
pkgrel=1
pkgdesc="Mopidy extension which lets you explore the HTTP API"
arch=('any')
url="https://github.com/dz0ny/mopidy-api-explorer"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('245a959dddfabccf796507d0ba2bf34a')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
