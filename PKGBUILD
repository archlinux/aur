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
sha512sums=("eec328c76335cef87af6f470c199b8ecdd90d71536643d309d548c11a4c14a70a6240317a1ea1b95b75f0338d3c0fb28e820feb88dcc92dd14f208ca1f80e945")
source=("http://downloads.sourceforge.net/project/$pkgname/${pkgver}/Source/$pkgname-${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py install --root="$pkgdir/" --optimize=1
}