# Maintainer: Acidhub <contact@acidhub.click>

pkgname=steam-tools
pkgver=0.7
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools"
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-crypto')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('754fcc91c7813c830c1cb2e5cab25a52d4e7c70c08ca1fc54fde6852a95ec5c9')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root=$pkgdir --prefix=/usr
}


