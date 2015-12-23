# Maintainer: hillbicks <hillbicks at doe dot ath dot cx>

pkgname=mopidy-mopify
_pypiname=Mopidy-Mopify
pkgver=1.5.10
pkgrel=1
pkgdesc="A mopidy webclient based on the Spotify webbased interface"
arch=('any')
url="https://github.com/dirkgroenen/mopidy-mopify"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('a9ae6cac30e38e93dd36e59505c3fe26')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

