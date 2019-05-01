# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com> 
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-knack
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python command line interface framework"
arch=('any')
url="https://github.com/Microsoft/knack"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/knack/archive/v${pkgver}.tar.gz")
sha256sums=('6bbc2c71d90ff97902fa63ba92228879e34f613d94b6eefe58e0f5c0481084de')

build() {
  cd "knack-${pkgver}"
  python setup.py build
}

package() {
  cd "knack-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

