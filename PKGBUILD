pkgname=allow-input-accelerometer-udev
pkgver=0.1.0
pkgrel=1
pkgdesc="Add uaccess tag to any accelerometer device, like nintendo switch pro controller"
arch=('any')
license=('MIT')
depends=('udev')
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("71-accelerometer.rules")
sha224sums=('6a36f6bffec762e4f5d1adb9e1badcb1ef2bde3e42379a49b69b7f0e')

pkgver() {
	echo "0.1.0"
}

package() {
    # install udev rules
    install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
    cp "${srcdir}/71-accelerometer.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
