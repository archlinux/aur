# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=8.4.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux" "parted" "p7zip" "python-six")
sha512sums=("83c44610849ed24439a944438bd6ceaf67aefc1648db3becc9a853eacd55651ecac64e8f94ca067803e689fe3071a72af782c346cc53810841f4d98bd493a498")
#source=("http://downloads.sourceforge.net/project/$pkgname/${pkgver}/Source/$pkgname-${pkgver}.tar.gz")
source=("https://github.com/mbusb/$pkgname/archive/v${pkgver}.tar.gz")


package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
