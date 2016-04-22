# Maintainer: Acidhub <contact@acidhub.click>

pkgname=steam-tools
pkgver=0.6.2
pkgrel=1
pkgdesc="Some useful tools for use with steam client and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools"
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-crypto')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}-beta.tar.gz")
sha256sums=('9263ff7bb91cdc495772f5b5486cadf482c3723701ba1bb251f94ca8c0b742d2')

package() {
    cd ${pkgname}-${pkgver}-beta
    python setup.py install --root=$pkgdir --prefix=/usr
}


