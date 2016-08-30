# Maintainer: Acidhub <contact@acidhub.click>

pkgname=steam-tools
pkgver=0.8.4
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools"
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-crypto')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('1ebe8a21a2bae315c5c574bdec07b9a657fd298218e2071afb8ee949024702e2')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root=$pkgdir --prefix=/usr
}


