# Maintainer: Yves Hoppe <info@yveshoppe.de>

pkgname=calypso
pkgver=1.2.7
pkgrel=1
pkgdesc="Manage your Wordpress.com and Jetpack-enabled sites in one place"
arch=(i686 x86_64)
url=https://desktop.wordpress.com/
license=(GPL2)
depends=()
conflicts=()
install=$pkgname.install

md5sums=('41de9438ecca07098031c356e0507f0a')

source=(https://public-api.wordpress.com/rest/v1.1/desktop/linux/download?type=deb)

prepare() {
	tar -xf data.tar.gz
}

package() {
    cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
