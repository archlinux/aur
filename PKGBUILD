# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=8.2.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python2-pyqt5" "python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux" "parted" "p7zip")
sha512sums=("9176436a633fba8cac4b8f09be18cb0336196aeca9eed6fb3c08bad9c268f3e200fbc50ed18dc891901d991b7a98cfaeb7d7b243a7efb93a62304726fda32f77")
source=("http://downloads.sourceforge.net/project/$pkgname/${pkgver}/Source/$pkgname-${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
