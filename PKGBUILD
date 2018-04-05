# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=9.2.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux" "parted" "p7zip" "python-six" "python-pyudev")

sha512sums=("461ce6edd835b2a017d96c3987338cd9004894949ac0b121fc289d100b7945dd89970f966e48310b97f312221a2f5a047190c55802d3a07a9eec0bf6ec22356d")
source=("https://github.com/mbusb/$pkgname/archive/v${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
