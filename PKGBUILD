# Maintainer: Yves Hoppe <info@yveshoppe.de>

pkgname=calypso
pkgver=1.1
pkgrel=1
pkgdesc="Manage your Wordpress.com and Jetpack-enabled sites in one place"
arch=(i686 x86_64)
url=https://desktop.wordpress.com
license=(GPL2)
depends=()
conflicts=()
install=$pkgname.install
changelog=$pkgname.changelog

md5sums=('e785a4ee7a3cfa3b83f64afbbc44af29')

source=(https://public-api.wordpress.com/rest/v$pkgver/desktop/linux/download?type=deb)

prepare() {
	tar -xf data.tar.gz
}

package() {
    cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
