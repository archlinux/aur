# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-moped
_pypiname=Mopidy-Moped
pkgver=0.4.2
pkgrel=1
pkgdesc="Responsive Web client for Mopidy"
arch=('any')
url="https://github.com/martijnboland/moped"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('b58c1aed8052b3982d11474a4d3918fd')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
