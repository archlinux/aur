# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Nathan Seva <nathan.seva@outlook.fr>
pkgname=imeditor
pkgver=0.6.2
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=("any")
url="https://github.com/ImEditor/ImEditor"
license=("GPL")
depends=("python" "python-setuptools" "python-pillow" "gtk3")
source=("$url/archive/$pkgver.tar.gz")
md5sums=("c528be351a97db80f9663bf261b8dc04")

build() {
    cd "$srcdir/ImEditor-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ImEditor-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
