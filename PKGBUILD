# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Maintainer: Angel_Caido <geussepe at gmail dot com>>

pkgname=multibootusb
pkgver=8.0.0
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python2-pyqt4" "mtools" "util-linux" "parted")
sha512sums=("fe62166ee027be89e3773b1d4236368999749d16c90e1ecf15f308c4550db1915492ea6bca889154b6601f65cf0424a6b8061a57bf8215e7c28fe9a93905e753")
source=("http://downloads.sourceforge.net/project/$pkgname/${pkgver}/Source/$pkgname-${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py install --root="$pkgdir/" --optimize=1
}