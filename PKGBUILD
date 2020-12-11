# Maintainer: hillbicks <hillbicks at doe dot ath dot cx>

pkgname=mopidy-mopify
_pypiname=Mopidy-Mopify
pkgver=1.7.3
pkgrel=1
pkgdesc='A web client that uses external web services to provide additional features and a more complete music experience.'
arch=('any')
url="https://github.com/dirkgroenen/mopidy-mopify"
license=('APACHE')
depends=('python' 'mopidy>=3' 'mopidy-spotify' 'python-configobj')
makedepends=('python' 'python-setuptools')
source=("https://github.com/dirkgroenen/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('245033f847178b185a62607ff92cf2a5')

package() {
      cd "${srcdir}/${pkgname}-${pkgver}"
        python setup.py install --root="${pkgdir}/" --optimize=1

          install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
      }

      # vim:set ts=2 sw=2 et:


