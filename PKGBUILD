# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=8.8.0
pkgrel=2
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux" "parted" "p7zip" "python-six" "python-pyudev" "dbus-x11")

sha512sums=("585bb8a4641535f1811e7a48d4e0bab3353ae8f8e4ca319dcbfd8b45b474927b341a52d4eaee3c3587af657231d861fa5977b49cf000b9f878b601748efd87cc")
source=("https://github.com/mbusb/$pkgname/archive/v${pkgver}.tar.gz")


package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
