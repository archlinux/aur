# Maintainer: Acidhub <contact@acidhub.click>

pkgname=steam-tools
pkgver=0.8.2
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools"
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-crypto')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('748051e6caee7b447ca30e1c34af482b602a9ea712538357fbf2a361a91af0f5')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root=$pkgdir --prefix=/usr
}


