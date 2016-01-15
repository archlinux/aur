# Maintainer: Yves Hoppe <info@yveshoppe.de>

pkgname=calypso
pkgver=1.2.5
pkgrel=1
pkgdesc="Manage your Wordpress.com and Jetpack-enabled sites in one place"
arch=(i686 x86_64)
url=https://desktop.wordpress.com
license=(GPL2)
depends=()
conflicts=()
install=$pkgname.install
changelog=$pkgname.changelog

md5sums=('0649ed92a6c6be420a0c1862fe06a1d1')

source=(https://desktop.wordpress.com/d/linux-deb)

prepare() {
	tar -xf data.tar.gz
}

package() {
    cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
