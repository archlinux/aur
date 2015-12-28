# Maintainer: hillbicks <hillbicks at doe dot ath dot cx>

pkgname=mopidy-mopify
_pypiname=Mopidy-Mopify
pkgver=1.5.12
pkgrel=3
pkgdesc='A web client that uses external web services to provide additional features and a more complete music experience.'
arch=('any')
url="https://github.com/dirkgroenen/mopidy-mopify"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify' 'python2-configobj')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('1fe72e85e22ae23a9f29855439306455')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

