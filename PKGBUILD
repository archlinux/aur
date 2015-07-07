# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-spotify-tunigo
_pypiname=Mopidy-Spotify-Tunigo
pkgver=0.2.1
pkgrel=3
pkgdesc="Mopidy extension for providing the browse feature of Spotify"
arch=('any')
url="https://github.com/trygveaa/mopidy-spotify-tunigo"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'python2-pykka>=1.1' 'mopidy-spotify>=1.2' 'python2-tunigo')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('e36dc110d3ad689663a99d35e5d22b61')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
