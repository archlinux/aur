# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=8.9.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux" "parted" "p7zip" "python-six" "python-pyudev")

sha512sums=("0b88c506f1748ca5d3053d690010e7a82aaad657550c0956fa0d9070634deb79db08d9ae10e51f8829570b5574fda234df7b5b45657104590fa976020564b387")
source=("https://github.com/mbusb/$pkgname/archive/v${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
