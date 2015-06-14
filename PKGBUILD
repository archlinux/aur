# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgname=mopidy-radio-de
_pypiname=Mopidy-radio-de
pkgver=0.2.0
pkgrel=1
pkgdesc="Mopidy extension to listen to internet radio stations and podcasts listed at radio.de, rad.io, radio.fr, and radio.at."
arch=('any')
url="https://github.com/hechtus/mopidy-radio-de"
license=('APACHE')
depends=('python2' 'python2-dateutil' 'mopidy>=0.18')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('6c4974d2d9530104599b51e7d2b052bb')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
