# Maintainer: Sergio Tridente < tioduke (at) gmail (dot) com >

pkgname=python-http-ece
pkgver=1.0.5
pkgrel=1
pkgdesc="Encrypted Content Encoding for HTTP"
arch=('any')
url="https://pypi.org/project/http-ece"
license=('MIT')
depends=(python)
source=(https://files.pythonhosted.org/packages/5c/20/aea4ced375989e35de1e420193c7d5af621d77b6fe4a827d936e67f5a2ea/http_ece-${pkgver}.tar.gz)
sha256sums=('2f31a0640c31a0c2934ab1e37005dd9a559ae854a16304f9b839e062074106cc')

package() {
  cd "http_ece-$pkgver"

  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
