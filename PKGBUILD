# Maintainer: sseneca <me at ssene dot ca>
pkgname=html5validator
pkgver=0.4.0
pkgrel=2
pkgdesc="Command line tool to validate HTML5 files."
arch=('any')
url="https://github.com/svenkreiss/html5validator"
license=('MIT')
depends=('python-yaml' 'java-environment-openjdk=8')
makedepends=('python' 'python-setuptools')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b37528430115d54971e2856c1d46268e9003a7c9f94b6e94c435d160b00c44dcc7f9bb32101ab2fc21a8cea61d03dc08df96639e4f8fb0b65a5d5d426ba68d1d')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
