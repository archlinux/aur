# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-btrfs
pkgver=5
pkgrel=1
pkgdesc="Python Btrfs"
arch=('any')
url="https://github.com/knorrie/python-btrfs"
license=('GPL3')
depends=()
makedepends=(python-pip)
md5sums=()

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps btrfs
    python -O -m compileall "${pkgdir}/usr/lib/python3.5/site-packages/btrfs.py"
}
