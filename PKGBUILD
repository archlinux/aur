# Maintainer: krrr <guogaishiwo@gmail.com>
pkgname=hazama
pkgver=0.40
pkgrel=1
pkgdesc="Diary application"
arch=('any')
url="https://krrr.github.io/hazama"
license=('GPL')
depends=('python' 'python-pyside')
makedepends=('python-setuptools' 'python-pyside-tools')
source=("https://github.com/krrr/Hazama/archive/v$pkgver.tar.gz")

build() {
    cd "$srcdir/Hazama-$pkgver"
    ./setup.py build
}

package() {
    cd "$srcdir/Hazama-$pkgver"
    # --skip-build avoid building again when --root specified
    ./setup.py install --root "$pkgdir/" --skip-build
}
md5sums=('a8f5d70f69d4d863f22d70419f770072')
