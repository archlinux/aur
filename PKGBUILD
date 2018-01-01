# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=9.0.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux" "parted" "p7zip" "python-six" "python-pyudev")

sha512sums=("0943ff956db5f22c79bf30693819dac3677cfc0db8dac4c77acfe7f74fa23c79b956a7e30987ef191a3be0a7c6d876c83fc086c0862cdef154d6b2bd4fd7f759")
source=("https://github.com/mbusb/$pkgname/archive/v${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
