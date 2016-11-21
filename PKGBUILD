# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=8.1.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python2-pyqt4" "mtools" "util-linux" "parted")
sha512sums=("0499902bd9d23728f578de73bcdaee8b3d1cd94b90f792a1a7f4968af9acbaeaf121febda8d95e3966f532bbffb965998585eff31f44a284fe1197daf57a4685")
source=("http://downloads.sourceforge.net/project/$pkgname/${pkgver}/Source/$pkgname-${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py install --root="$pkgdir/" --optimize=1
}