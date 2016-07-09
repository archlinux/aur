# Maintainer: Acidhub <contact@acidhub.click>

pkgname=steam-tools
pkgver=0.8.3
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools"
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-crypto')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('1b64a179e132e8a65e85b1e6cc18d39eb0309109471f88724f0c18baab05cae5')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root=$pkgdir --prefix=/usr
}


