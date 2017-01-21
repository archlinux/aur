# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-binstruct
pkgver=1.0.0
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/Jokymon/binstruct"
license=('GPL3')
depends=(pip)
md5sums=()
#install=.install

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps binstruct
    python -O -m compileall "${pkgdir}/usr/lib/python3.5/site-packages/binstruct.py"
}
