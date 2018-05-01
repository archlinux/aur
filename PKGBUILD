# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=python2-uinput
pkgver=0.11.2
pkgrel=2
pkgdesc="Pythonic API to Linux uinput kernel module"
arch=("any")
url="https://github.com/tuomasjjrasanen/python-uinput"
license=("GPL")
depends=("python2")
makedepends=("python2-setuptools")
options=("!emptydirs")
source=("https://codeload.github.com/tuomasjjrasanen/python-uinput/tar.gz/0.11.2")
sha512sums=("50fedc43fddbb690782196af6e9e9363f73d4ec65c7d356750db0ac846dfc7cf7f98d406aaa035684f1fe7f17e02679047cccd07c9c232d1bbdc2f1fc2a8d97e")

package() {
    cd "$srcdir/python-uinput-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
