# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-binstruct
pkgver=1.0.1
pkgrel=1
pkgdesc="Library for read/write access of binary data via structures"
arch=('any')
url="https://github.com/Jokymon/binstruct"
license=('GPL3')
depends=()
makedepends=(python-pip)
md5sums=()

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps binstruct=="${pkgver}"
}
